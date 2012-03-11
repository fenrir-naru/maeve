#command_log��������

base_dir = File.dirname(__FILE__)
$: << "#{base_dir}" << "#{base_dir}/../lib"
require 'optparse'
require 'time'
require 'log_manager'
require 'com_stream'
require 'kconv'

# option parser
opts = {}
OptionParser.new {|opt|
	opt.on('--since val'){|v| opts[:since] = v}
	opt.on('--till val'){|v| opts[:till] = v}
	opt.parse!(ARGV)
}

# usage instruction
if ARGV.size < 1 then puts <<"EOS"
DESCTIPTION
	command_log��������
ARGS
	log-file [option]
OPTION
	--since date[ time]	�w�肵�������ȍ~�̃��O��������
	--till date[ time]	�w�肵�������ȑO�̃��O��������
	�����̏���: 2010/1/23, 20100123_1234���B��̂ǂ������Ă��F�������B
EOS
	exit -1
end


logname = ARGV[0]
t_begin = Time.parse(opts[:since]) if opts[:since]
t_end = Time.parse(opts[:till]) if opts[:till]
if t_begin && t_end && t_begin > t_end
	puts "--till must be later than --since"
	exit -1
end

def depacketize data
	dpk = Mv::ComStreamDepacketizer.new
	payload = dpk.depacketize(data)[0][:payload]
	cid = payload[0..1].unpack('s')[0]
	cmd = payload[2..-1]
	{:cid => cid, :cmd => cmd}
end
		
log_manager = Mv::LogManager.new(logname)
log_manager.each(t_begin, t_end) do |timestamp, cmd|
	p timestamp, depacketize(cmd)
end