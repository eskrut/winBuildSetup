. ./rc

#content of patching bat file
#C:\opt\msys64\usr\bin\bash.exe -l -c "export PATH=/mingw32/bin:$PATH && /c/opt/winbuildsetup/qthtSoft.sh &"

cp qthtSoft.bat .local/qthtSoft.bat && \
sed -i 's/C:\\opt/'$WIN_BASE_DISK'/g' .local/qthtSoft.bat && \
sed -i 's/\/c\/opt/\/'${DISK_LABEL}'\/'${DISK_SUFFIX}'\//g' .local/qthtSoft.bat && \
cp .local/qthtSoft.bat $LOCAL_DIR