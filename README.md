SMS package to use Future SMS (EGYPT ONLY).

## Features

* You can send OTP SMS with a simple click.
* Server-side verification guarantees safety.
* Future SMS can return firebase custom token to sign in with firebase auth.

## Getting started

- Please contact Kar1mMohamed to get your token at karim@kar1mmohamed.com, please attach your phone number to contact

## Usage

- First of all we need to initilize the package at main.dart before runApp

   ```dart
     FutureSMS.initlize(token: 'YOUR-TOKEN');
   ```

- And then send the otp
    
    ```dart
          var response = await FutureSMS.instance.sendOTP(
        countryCode: '+20',
        phoneNumber: phoneNumber,
        customText: Constants.otpMessage,
      );

      if (response.verificationID != null) {
        CustomSnackBar.success('Code sent successfully'.tr);
        isCodeSent = true;
        sentToPhoneNumber = phoneNumber;
        verificationId = response.verificationID!;
        log('verificationId: $verificationId');
      }
    ```
* Please note that the customText is optional, you can send it without it.


- To verify the otp

    ```dart
      var response = await FutureSMS.instance.verifyOTP(
          otp: smsCode,
          verificationID: verificationId,
          userUID: phoneNumber.replaceAll('+', ''));
    ```
* userUID is optional, you can send it without it.
* Use userUID to identify the user in your database.
* The response here will return that OTP verified successfully or not.
* If you setted your firebase service account it will return the custom token to sign in with firebase auth.

## Thanks

* You can donate to support me at [PayPal](https://www.paypal.me/kar1mmohamed)
![Kar1mMohamed](https://raw.githubusercontent.com/Kar1mMohamed/future_sms/main/images/Paypal.png)

