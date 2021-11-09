abstract class AuthFailure {}

class ServerFailure extends AuthFailure {}

class EMailAlreadyInUseFailure extends AuthFailure {}

class InvalidEMailAndPasswordCombinationFailure extends AuthFailure {}
