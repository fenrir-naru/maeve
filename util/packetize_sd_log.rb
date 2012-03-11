#Sylphide��SD���O(src-file)��Maeve�`���t�@�C��(dst-file)�ɕϊ�����
#SD���O��begin(KB)����end(KB)�܂ŕϊ�����i�ȗ��j

base_dir = File.dirname(__FILE__)
$: << "#{base_dir}" << "#{base_dir}/../lib"
require 'optparse'
require 'com_stream'
require 'mv_ext_util'
include MvExtUtil


# option parser
opts = {}
OptionParser.new {|opt|
	opt.on('-i val'){|v| opts[:i] = v}
	opt.on('-e val'){|v| opts[:e] = v}
	opt.on('-t'){opts[:t] = true}
	opt.parse!(ARGV)
}
if opts[:i] && opts[:e]
	puts "-i and -e options cannot be set together."
	exit -1
end

# usage instruction
if ARGV.size < 2 then puts <<"EOS"
DESCTIPTION
	Sylphide�`�����O��Maeve�`���ɕϊ�����
ARGS
	src-file dst-file [begin(KB) [end(KB)]] [option]
OPTION
	-i page(s)	�w�肵���y�[�W��ϊ�����(include)
	-e page(s)	�w�肵���y�[�W�ȊO��ϊ�����(exclude)
	-t	�^�C���e�[�u��(*.ttb)���쐬����
	-i,-e�I�v�V�����ł͕����̃y�[�W���w��ł���B��: -i AFN
	-i,-e�I�v�V�����͓����Ɏw��ł��Ȃ��B�ǂ�����w�肵�Ȃ��Ƃ��ׂẴy�[�W��ϊ�����B
EOS
	exit -1
end


pktz = Mv::ComStreamPacketizer.new
seqnum = 1234
nread=0
npacket=0
nwritten=0

ifname = ARGV[0]
ofname = ARGV[1]
begin_pos = (ARGV[2] || 0).to_i * 1024
end_pos = ARGV[3].to_i * 1024 if ARGV[3]

File.open(ifname, "rb"){|fi|
	File.open(ofname, "wb"){|fo|
		fi.pos = begin_pos
		fi_size = fi.stat.size
		end_pos = end_pos ? [end_pos, fi_size].min : fi_size
		while fi.pos < end_pos && dat = fi.read(32) do
			nread += dat.length
			page = dat[0].chr
			next if opts[:i] && !opts[:i].include?(page)
			next if opts[:e] && opts[:e].include?(page)
			packet = pktz.packetize(dat, seqnum)
			npacket += packet.length
			nwritten += fo.write packet
			seqnum += 1
			seqnum = 0 if seqnum>65535
			MvExtUtil.print_progress(fi.pos, fi_size)
		end
	}
}

puts "begin: #{begin_pos}, end: #{end_pos}"
puts "read: #{nread}, pack: #{npacket}, written: #{nwritten}"

if opts[:t]
	puts "generating timetable..."
	exec('ruby', "#{base_dir}/generate_ttb.rb", ofname)
end