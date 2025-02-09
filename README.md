# homebrew-package-cleaner

This script filters out older Homebrew packages based on their last access time.

## Features
- Lists packages that haven't been used since a specified date.
- Provides brief information about each package.
- Easy to use and customizable.

## Installation
1. Clone the repository:
   ```sh
   git clone https://github.com/yourusername/homebrew-package-cleaner.git
   cd homebrew-package-cleaner
   ```
2. Make the script executable:
   ```sh
   chmod +x filter_old_brew_packages.sh
   ```

## Usage
To filter out packages not used since January 1, 2023:
```sh
./filter_old_brew_packages.sh 2023-01-01
```
To automatically use the date one year ago:
```sh
./filter_old_brew_packages.sh $(date -v -1y '+%Y-%m-%d')
```
Output Example
```sh
aribb24 (Library for ARIB STD-B24, decoding JIS 8 bit characters and parsing MPEG-TS) was last accessed on 2023-03-02.
```

## Contributing
Feel free to submit issues, fork the repository, and send pull requests. For major changes, please open an issue first to discuss what you would like to change.

## License
This project is licensed under the MIT License.
