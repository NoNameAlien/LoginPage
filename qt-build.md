# Инструкция по сборке Qt из файлов исходного кода

## Архив с файлами

- [Ссылка на архив с сурсами](https://download.qt.io/official_releases/qt/6.6/6.6.0/single/qt-everywhere-src-6.6.0.tar.xz?__hstc=45788219.e9dba1c46f2e1969a08372456147125d.1689755853338.1689755853338.1689755853338.1&__hssc=45788219.1.1689755853338&__hsfp=783877104)
> Для начала скачивания необходимо включить VPN, а сразу после выключить (чтобы получить приемлимую скорость загрузки)

## Зависимости

- CMake
- Ninja
- Python 3
- [Qt for X11 Requirements](https://doc.qt.io/qt-6/linux-requirements.html):
    ```
    sudo apt-get install -y libfontconfig1-dev && \
    sudo apt-get install -y libfreetype6-dev && \
    sudo apt-get install -y libx11-dev && \
    sudo apt-get install -y libx11-xcb-dev && \
    sudo apt-get install -y libxext-dev && \
    sudo apt-get install -y libxfixes-dev && \
    sudo apt-get install -y libxi-dev && \
    sudo apt-get install -y libxrender-dev && \
    sudo apt-get install -y libxcb1-dev && \
    sudo apt-get install -y libxcb-cursor-dev && \
    sudo apt-get install -y libxcb-glx0-dev && \
    sudo apt-get install -y libxcb-keysyms1-dev && \
    sudo apt-get install -y libxcb-image0-dev && \
    sudo apt-get install -y libxcb-shm0-dev && \
    sudo apt-get install -y libxcb-icccm4-dev && \
    sudo apt-get install -y libxcb-sync-dev && \
    sudo apt-get install -y libxcb-xfixes0-dev && \
    sudo apt-get install -y libxcb-shape0-dev && \
    sudo apt-get install -y libxcb-randr0-dev && \
    sudo apt-get install -y libxcb-render-util0-dev && \
    sudo apt-get install -y libxcb-util-dev && \
    sudo apt-get install -y libxcb-xinerama0-dev && \
    sudo apt-get install -y libxcb-xkb-dev && \
    sudo apt-get install -y libxkbcommon-dev && \
    sudo apt-get install -y libxkbcommon-x11-dev
    ```

- Bison
    ```
    sudo apt-get install bison
    ```

- [Установка графического драйвера Mesa](https://linuxcool.net/instrukczii/kak-ustanovit-poslednij-graficheskij-drajver-mesa-v-ubuntu-20-04-21-04/)

- libclang-dev
    ```
    sudo apt-get install libclang-dev
    ```
- flex
    ```
    sudo apt-get install flex
    ```

- Node.js
    ```
    sudo apt-get install nodejs
    ```

- html5lib
    ```
    sudo pip install html5lib
    ```

## Примечания

- Можно провести билд без модуля QtWebEngine, но в дальнейшем он необходим, поэтому лучше его собрать сразу
