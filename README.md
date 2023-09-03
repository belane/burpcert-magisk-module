# **System Burp Certificate**
## Description
Magisk module designed to move the Burp certificate from the user certificate store to the system store on Android devices. The main purpose is to allow users to intercept applications network traffic, especially since from Android 7 (Nougat) and onwards, a rooted device is required to install a CA certificate at the system level.

Interacting with HTTPS traffic demands the installation of a CA certificate from Burp Suite on your Android device. With the deprecation of the traditional method of user certificate installation from Android Nougat and above, this module offers a more straightforward approach to get the Burp CA trusted at the system level.

## Installation
1. Install Burp certificate as user.
2. Install the module via Magisk, `Magisk → Modules → Install from storage`.
3. After installation, the Burp CA certificate will be available in the system trusted certificates, viewable from `Settings → Security → Trusted Credentials`.

## Note

Android's trusted CAs are stored in `/system/etc/security/cacerts`. This module, leveraging root privileges, modifies this location to include the Burp CA. This module assumes Burp cert hash is `9a5ba575`.

## Disclaimer

Using this module can make your device less secure by trusting a custom certificate. Please ensure you understand the risks associated with intercepting network traffic and proceed with caution.
