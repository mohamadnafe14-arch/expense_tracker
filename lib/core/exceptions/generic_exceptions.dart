class GenericException implements Exception {
  final String message;

  const GenericException(this.message);
}

class FireStoreException extends GenericException {
  const FireStoreException(super.message);
}

class PermissionDeniedException extends FireStoreException {
  const PermissionDeniedException(super.message);
}

class UnAuthenticatedException extends FireStoreException {
  const UnAuthenticatedException(super.message);
}

class UnavailableServiceException extends FireStoreException {
  const UnavailableServiceException(super.message);
}

class NotFoundException extends FireStoreException {
  const NotFoundException(super.message);
}

class AlreadyExistsException extends FireStoreException {
  const AlreadyExistsException(super.message);
}

class InvalidArgumentException extends FireStoreException {
  const InvalidArgumentException(super.message);
}
