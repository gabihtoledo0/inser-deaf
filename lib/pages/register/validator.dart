class Validator {
  String validarNome(String value) {
    String patttern = r'(^[a-zA-Z ]*$)';
    RegExp regExp = new RegExp(patttern);
    if (value.length == 0) {
      return "Informe o nome";
    } else if (!regExp.hasMatch(value)) {
      return "O nome deve conter caracteres de a-z ou A-Z";
    }
    return null;
  }

  String validarCelular(String value) {
    if (value.length == 0) {
      return "Informe o celular";
    } else if (value.length != 14) {
      return "O celular deve ter 11 dígitos";
    }
    return null;
  }

  String validarEmail(String value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return "Informe o Email";
    } else if (!regExp.hasMatch(value)) {
      return "Email inválido";
    } else {
      return null;
    }
  }

  String validarSenha(String value) {
    String pattern =
        r'(?=^.{8,}$)(?=.*[0-9])(?=.*[A-Z])(?=.*[a-z])(?=.*[^A-Za-z0-9]).*';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return "Informe a senha de no mínimo 8 caracteres";
    } else if (!regExp.hasMatch(value)) {
      return "A senha deve conter um caractere especial, uma letra maiúscula, uma letra minúscula e um número.";
    } else if (value.length < 8) {
      return "A senha deve no mínimo 8 caracteres.";
    } else {
      return null;
    }
  }
}
