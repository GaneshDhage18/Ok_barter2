customTextValidator(String? value) {
  if(value == '' || value == null) {
    return 'This Field is required';
  }
}