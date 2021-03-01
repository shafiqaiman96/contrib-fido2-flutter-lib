// Corresponds to AuthenticatorAssertionResponse
class SigningResult {
  SigningResult(this.keyHandle, this.clientData, this.authData, this.signature, this.userHandle);

  /// This is the identifier for the credential generated by the authenticator.
  ///
  /// It will be used by the WebAuthn server and the FIDO client to identify
  /// which credential is being verified.
  ///
  /// Encoded in Base64URL
  final String keyHandle;

  /// This is the JSON which contains client data that was involved in the creation
  /// of the credential.
  ///
  /// e.g. clientDataJSON:
  /// {"type":"webauthn.create",
  /// "challenge":"randomchallenge123132w",
  /// "origin":"android:apk-key-hash:JHlnXtZwMQ58Zub2_zAzw_Dg8GJQS5_yMmgjfi6cw3g",
  /// "androidPackageName":"mojaloop.fido2.fido2_client_example"}
  ///
  /// Encoded in Base64URL
  final String clientData;

  /// The data that is created the authenticator (FIDO client) and is consumed
  /// by a WebAuthn server in order to verify credentials.
  ///
  /// The authenticator data consists of a public cryptographic key, sign count,
  /// AAGUID (Authenticator Attestation Globally Unique Identifier), rpIdHash
  /// which are all used to verify the validity of a user's identity.
  ///
  /// Encoded in Base64URL
  final String authData;

  /// This is a signature over the binary concatenation of cData and [authData]
  /// where cData is produced by computing a hash over the [clientData] using SHA-256.
  ///
  /// It is created by signing using the private key of the keypair that was
  /// generated by the FIDO client during the registration phase.
  ///
  /// Encoded in Base64URL
  final String signature;

  /// An opaque identifier used by the server to identify the user linked
  /// with this credential.
  ///
  /// Encoded in Base64URL
  final String userHandle;
}