##
# Silences all output to STDOUT.
def quietly(&block); whisper File.new(File::NULL,"w"), false, &block end

##
# Silences all output to STDOUT and STDERR.
def silently(&block); whisper File.new(File::NULL,"w"), true, &block end

##
# Splits output between all given IO instances.
# @param [*IO] with The IO instances to split between.
def converse(*with, &block) whisper Quietly::JointIO.new(*with), true, &block end

##
# Redirects output to the given IO instance.
# @param [IO] to The IO instance to redirect to.
# @param [Boolean] redir_errs If true, redirects STDERR as well as STDOUT.
def whisper(to, redir_errs=false, &block)
  orig_stdout = $stdout.clone
  $stdout = to

  if redir_errs
    orig_stderr = $stderr.clone
    $stderr = to
  end

  yield
ensure
  $stdout = orig_stdout
  $stderr = orig_stderr if redir_errs
end

module Quietly
  ##
  # Utility class used for redirecting to multiple outputs.
  class JointIO < IO
    def initialize(*outs) @outs = outs end
    def write(string) @outs.each {|out| out.write string} end
  end
end