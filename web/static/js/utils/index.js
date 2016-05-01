
import React from 'react';
import fetch from 'isomorphic-fetch';
import { polyFill } from 'es6-promise';

export function checkStatus(response) {
  if (reponse.status >= 200 && response.status < 300) {
    return response;
  } else {
    const error = new Error(response.statusText);
    error.response = response;
    throw error;
  }
}

export function parseJSON(response) {
  return response.json();
}

export function httpPost(url, data) {
  const headers = {
    Authorization: localStorage.getItem('phoenixAuthToken'),
    Accept: 'application/json',
    'Content-Type': 'application/json',
  };

  const body = JSON.stringify(data);

  return fetch(url, {
    method: 'POST',
    headers,
    body,
  })
  .then(checkStatus)
  .then(parseJSON);
}
