@echo off
REM ============================================================
REM  Mo trang PoseAI tren may de xem thu (ke ca mo hinh 3D).
REM  Bam dup vao file nay la xong - no tu mo trinh duyet.
REM
REM  Vi sao phai chay kieu nay thay vi bam dup index.html:
REM  trinh duyet chan trang chay tu file:// doc file .glb,
REM  nen mo thang se mat mo hinh 3D (va ca service worker).
REM  Chay qua http://localhost thi moi thu hoat dong day du.
REM
REM  Muon tat: dong cua so den nay (hoac bam Ctrl + C).
REM ============================================================

cd /d "%~dp0"

set PORT=8777

REM Tim Python (py launcher truoc, roi den python)
where py >nul 2>nul && (
  start "" http://localhost:%PORT%/index.html
  py -m http.server %PORT% --bind 127.0.0.1
  goto :eof
)

where python >nul 2>nul && (
  start "" http://localhost:%PORT%/index.html
  python -m http.server %PORT% --bind 127.0.0.1
  goto :eof
)

REM Khong co Python thi thu Node
where npx >nul 2>nul && (
  start "" http://localhost:%PORT%/index.html
  npx --yes http-server -p %PORT% -a 127.0.0.1 -c-1
  goto :eof
)

echo.
echo  Khong tim thay Python hoac Node tren may.
echo  Cai Python tai https://www.python.org/downloads/ roi chay lai file nay.
echo.
pause
