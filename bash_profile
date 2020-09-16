# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

bind  '"\C-b":backward-word'
bind  '"\C-f":forward-word'

export LC_CTYPE="zh_CN.UTF-8"
#export CDPATH=/home/atz/:/home/atz/fans_router/

alias ftp=lftp
alias vi=vim
alias ll="ls -l "
alias lt="ls -lt "
alias grep="grep -n "
alias cz="make -C /home/atz/xlp-f6/trunk/zebos/platform/linux clean"
alias cl="make -C /home/atz/xlp-f6/trunk/linuxapps clean"
alias cn="make -C /home/atz/xlp-f6/trunk/hyperapps/nat  clean"

alias m3='pushd . &&  cd /home/atz/xlp-f6/trunk/projects/F6_prj/ && ./build 3rdparty ;popd'
alias mz="pushd . &&  cd /home/atz/xlp-f6/trunk/projects/F6_prj/ && ./build zebos ; popd"
alias ml="pushd . &&  cd /home/atz/xlp-f6/trunk/projects/F6_prj/ && ./build linuxapps ;popd"
alias mn="pushd . &&  cd /home/atz/xlp-f6/trunk/projects/F6_prj/ && ./build netos_hyperapp ; popd"
alias mk="pushd . &&  cd /home/atz/xlp-f6/trunk/projects/F6_prj/ && ./build linux_kernel ; popd"
alias mm='pushd . &&  cd /home/atz/xlp-f6/trunk/projects/F6_prj/ && ./build linux_userspace_kmod  ; popd'

alias c9z="make -C /home/atz/f9-xlp/trunk/zebos/platform/linux clean"
alias c9l="make -C /home/atz/f9-xlp/trunk/linuxapps clean"
alias c9n="make -C /home/atz/f9-xlp/trunk/hyperapps/nat  clean"
alias m9z="pushd . &&  cd /home/atz/f9-xlp/trunk/projects/F9_prj/ && ./build zebos ; popd"
alias m9l="pushd . &&  cd /home/atz/f9-xlp/trunk/projects/F9_prj/ && ./build linuxapps ;popd"
alias m9n="pushd . &&  cd /home/atz/f9-xlp/trunk/projects/F9_prj/ && ./build netos_hyperapp ; popd"
alias m9k="pushd . &&  cd /home/atz/f9-xlp/trunk/projects/F9_prj/ && ./build linux_kernel ; popd"

alias cksvn="ls|egrep -v linux |xargs -i- svn st - |grep ^M"

# For RMI SDK
#export CROSS=/home/atz/RMI-1.7/mipscross
#export PATH=$PATH:$HOME/bin:/$HOME/local/bin:$CROSS/crosstool/gcc-3.4.3-glibc-2.3.6/mipsisa32-xlr-linux/bin:$CROSS/elf/bin:$CROSS/nptl/bin:/usr/sbin:/sbin:/opt/xlp_mipscross/mipscross/linux/bin:/opt/xlp_mipscross/mipscross/elf/bin:/opt/xlp_mipscross/mipscross/linux/bin:/usr/local/sbin:/usr/sbin:/sbin:/usr/local/bin:/usr/bin:/bin:/usr/games:/usr/lib/java/bin:/usr/lib/qt/bin:/usr/share/texmf/bin:/home/atz/bin://home/atz/local/bin:/home/atz/RMI-1.7/mipscross/crosstool/gcc-3.4.3-glibc-2.3.6/mipsisa32-xlr-linux/bin:/home/atz/RMI-1.7/mipscross/elf/bin:/home/atz/RMI-1.7/mipscross/nptl/bin:/usr/sbin:/sbin
#export TGTDIR=~/xlp-f6/trunk
#export RMIOS_LIB=$TGTDIR/rmios_lib
#export APPDIR=$TGTDIR/linuxapps
#export APPINC=$TGTDIR/include
#export KERINC=$TGTDIR/kernel/include

# For BCM SDK
#export KERNDIR=~/iTM/trunk/kernel
#export BCM1125_COMPILE_PATH=systems/linux/kernel/nsx64
#export SDK=~/iTM/trunk/sdk-xgs-robo-5.9.2
#export MIPS_CROSS_COMPILE=mips64-unknown-linux-gnu-
#export MODULE_LDFLAGS=-melf64btsmip
#export LINUX_INCLUDE=${KERNDIR}/include

export LARCH_PATH=usr/local/share/splint/lib
export LCLIMPORTDIR=usr/local/share/splint/import

#for XLP
#export TGTDIR=~/xlp
#export TOOLCHAINS_DIR=/opt/xlp_mipscross
#export TOOLCHAINS_HYPEREXEC_INSTALL_DIR=${TOOLCHAINS_DIR}/mipscross/elf/mips64-nlm-elf/lib/xlp/libn32
#export TOOLCHAINS_HYPEREXEC_INC_INSTALL_DIR=${TOOLCHAINS_DIR}/mipscross/elf/mips64-nlm-elf/include
#export PATH=$PATH:${TOOLCHAINS_DIR}/mipscross/elf/bin:${TOOLCHAINS_DIR}/mipscross/linux/bin
#source ${TOOLCHAINS_DIR}/toolchain_setup.sh >/dev/null

#settclinux >/dev/null
#settcelf   > /dev/null

alias mdu='memdump --servers 127.0.0.1:11211'
alias mrm='memrm --servers 127.0.0.1:11211 '
alias mall='memdump --servers 127.0.0.1:11211|tee /tmp/__s|xargs -i{} memcat --servers 127.0.0.1:11211 {};cat /tmp/__s'
alias mcat='memdump --servers 127.0.0.1:11211|tee /tmp/__s|xargs -i{} memcat --servers 127.0.0.1:11211 {}'
alias mshow='memcat --servers 127.0.0.1:11211 '
alias nginx_reload='nginx -s reload'

alias rdu='redis-cli -h 127.0.0.1 -p 6379 --scan '
alias rrm='redis-cli -h 127.0.0.1 -p 6379 del '
alias rshow='redis-cli -h 127.0.0.1 -p 6379 get '

export LARCH_PATH=/usr/local/splint/share/splint/lib
export LCLIMPORTDIR=/usr/local/splint/share/splint/import
export PATH=/usr/local/splint/bin:$PATH:/usr/local/lib/tsung/bin/

cd /home/atz/fans_router/

alias gmstatus="gearadmin --status"
alias restart_cache="service memcached restart;service redis restart"

alias valgrind="valgrind -v --tool=memcheck   --leak-check=full    --undef-value-errors=yes   --smc-check=all "

alias showlog='redis-cli -p 6379 llen  ilog_default_q'


[[ -s /root/.autojump/etc/profile.d/autojump.sh ]] && source /root/.autojump/etc/profile.d/autojump.sh

