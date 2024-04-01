@echo off
setlocal enabledelayedexpansion

set "filename=Fooocus\fooocus_version.py"
set "search=version ="

for /f "tokens=2 delims=''" %%a in ('findstr /c:"%search%" %filename%') do (
  set "version=%%a"
)

echo.
echo ------------------ 图像生成工具 Fooocus 启动器 ------------------
echo.
echo 版本要求 2.1.780 及以上，额外文件要求：翻译文档 Fooocus\language\cn.json
echo.
echo （2.1.817 版本起，支持通过修改脚本代码参数切换深浅主题， --theme dark， --theme light）
echo.
echo 你目前的 Fooocus 版本号为：%version% 
echo.
echo -----------------------------------------------------------------
echo.
echo 编号 1. 自动更新，启动 默认预设，英文界面，浅色主题
echo.
echo 编号 2. 自动更新，启动 默认预设，中文界面，浅色主题
echo.
echo ----------------------------------------
echo.
echo 编号 3. 禁用更新，启动 默认预设，英文界面，浅色主题
echo.
echo 编号 4. 禁用更新，启动 默认预设，中文界面，浅色主题
echo.
echo 编号 5. 禁用更新，启动 动漫预设，中文界面，深色主题 --
echo.
echo 编号 6. 禁用更新，启动 写实预设，中文界面，深色主题 --
echo.
echo 编号 7. 禁用更新，启动 默认预设，中文界面，深色主题 --
echo.
echo -----------------------------------------------------------------
echo.

set /p num=请输入启动命令的编号：

if "%num%"=="1" (
    .\python_embeded\python.exe -s Fooocus\entry_with_update.py --language en --theme light
    pause
) else if "%num%"=="2" (
    .\python_embeded\python.exe -s Fooocus\entry_with_update.py --language cn --theme light
    pause
) else if "%num%"=="3" (
    .\python_embeded\python.exe -s Fooocus\launch.py --language en --theme light
    pause
) else if "%num%"=="4" (
    .\python_embeded\python.exe -s Fooocus\launch.py --language cn --theme light
    pause
) else if "%num%"=="5" (
    .\python_embeded\python.exe -s Fooocus\launch.py --language cn --preset anime --theme dark
    pause
) else if "%num%"=="6" (
    .\python_embeded\python.exe -s Fooocus\launch.py --language cn --preset realistic --theme dark
    pause
) else if "%num%"=="7" (
    .\python_embeded\python.exe -s Fooocus\launch.py --language cn --theme dark
    pause
) else (
    echo 输入的编号无效
)