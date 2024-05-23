# Advanced Features of ROOBI OS

This content is aimed at professionals, and you should be aware of the consequences of all your actions.

## ROOBI OS: A Highly Customized Linux System

ROOBI grants full permission to run Linux commands.

You can run Linux commands as usual, but you should have some professional knowledge. Otherwise, refrain from using the command-line interface.

## Accessing the Terminal

Press Ctrl + Alt + F2 to access the terminal interface. The username and password are both 'ps'.

## Enabling SSH Connection

ROOBI OS provides a quick way to enable SSH by simply running `ssh` in the command line. ROOBI has aliased the ssh command for convenience.

If your device is [ROCK 5 ITX](https://radxa.com/products/rock5/5itx), SSH is enabled by default.

To SSH into other devices using ROOBI OS, you can run it with sudo.

## Manually Updating the ROOBI Main Program

Simply input `roobi update` in the terminal, and there will be corresponding log output.

## Setting Up Custom Image Sources

ROOBI communicates in a straightforward manner, with the following general process:

1. Obtain a list of images through a network JSON list.
2. Get details of the images from the image list: download links, installation methods, etc.

For specific instructions, refer to: [Writing Installation Scripts](#writing-installation-scripts).

Use the network address of the JSON file list as the address for custom image sources.

## Writing Installation Scripts

### Script File Version (script_version)

[str]

Keep this value as 1; modifications are not allowed.

### UUID

[str]

Represents the unique value of this installation file.

### Name

[str]

Will be displayed on the installation interface.

### Image (img)

[str]

URL address of the image for this installation file.

### Description

[str|langObject]

Description of this installation file, should include copyright, notes, etc.

### Version

[str]

Version of this installation file, for display purposes only.

### Author

[str]

Author of this installation file, for display purposes only.

### Date

[str]

### Download

object|array[object]

#### Contents of object

file_name: [str] Name to save the file.
size: [int] Size of the file in bytes.
urls: [str|array[str]] URLs for downloading, allowing for chunked downloads.
md5: [str] MD5 checksum of the entire file.

### Running Scripts

#### Supported Formats

scriptObject|array[scriptObject]

Scripts will be executed sequentially according to the script object.

#### Details of scriptObject are as follows

type: [str|null] Choose from the following contents:

1. auto:

   If your scriptObject contains this type, no other types are allowed. This item will require:

   1. The downloaded file name can only include one of the following: image: .img/.img.gz/.img.xz, pre-installation script: before.sh, post-installation script: after.sh. Scripts support formatted text. If these scripts end with a return value of 0, the installation is successful; otherwise, it throws an error.
   2. The image must include partition information.
   3. The program will automatically generate a parameter named 'disk'.
   4. img\*, before, and after files can be empty.
   5. size: If the file is gzipped, this parameter can be added to reduce reading the entire file.

For safety reasons: Only this parameter is supported in the current version.

### Other

#### Formatted Text

Allow strings to contain a layer of braces, and put the **parameter names** inside, for example, "dd if=xx.img of=\{disk\}" The program will automatically convert this text to "dd if=xx.img of=/dev/sda" (assuming disk is "/dev/sda"). To output braces "\{" and "\}", use "\{\{" and "\}\}" respectively.

Currently, only the disk parameter is supported in this version.

#### langObject

Text that supports multiple languages.

Formatted as Country Code: Text

For example:

```json
{
  "en": "Choose the disk to install.",
  "zh-CN": "选择安装的磁盘"
}
```

### Contents of list.json

[list[object]]

object:

uuid: Same as the uuid mentioned above, these two must match.
name: Same as the name mentioned above, it's best to keep them consistent.
url: Points to the URL of the script content mentioned above.

## Uploading Your Image to the Official Source

Refer to the [GitHub](https://github.com/radxa/roobi-config/pulls) repository.
