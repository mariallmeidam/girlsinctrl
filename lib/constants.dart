import 'package:flutter/material.dart';

// Constantes

// pega a base url do projeto em API
const baseURL = 'https://girls-crtl.domcloud.io/api';
const loginURL = baseURL + '/login';
const registerURL = baseURL + '/register';
const logoutURl = baseURL + '/logout';
const userURL = baseURL + '/user';
const newsURL = baseURL + '/noticias';
const likenewsURL = baseURL + '/likenews';
const likeinitiativesURL = baseURL + '/likeinitiatives';
const initiativeURL = baseURL + '/initiative';
const getLikeNewsURL = baseURL + '/getnews';
const getLikeInitiativesURL = baseURL + '/getinitiatives';
const getWomansNewsURL = baseURL + '/newsWomans';
const getInstagramURL = baseURL + '/instagram';
const forgetURL = baseURL + '/forget';
const resetURL = baseURL + '/reset';
const jobsURL = baseURL + '/jobs';

// Errors

const serverError = "Erro no servidor";
const unauthorized = "Não autorizado";
const somethingWrong = "Algo deu errado, tente novamente!";
