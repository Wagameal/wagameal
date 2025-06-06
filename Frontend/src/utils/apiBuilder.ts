import axios from "axios";
import type { AxiosResponse, AxiosRequestConfig } from "axios";

const token = "";

export const getRequest = (url: string): Promise<AxiosResponse> => {
  const headers: any = {};
  if (token) {
    headers["Authentication"] = "Bearer " + token;
  }
  return axios.get(url, headers);
};

export const getRequestWithData = (
  url: string,
  data: any
): Promise<AxiosResponse> => {
  const headers: any = {};
  if (token) {
    headers["Authentication"] = "Bearer " + token;
  }
  const config: AxiosRequestConfig = {
    params: data,
    headers: headers,
  };
  return axios.get(url, config);
};

export const postRequest = (url: string, data: any): Promise<AxiosResponse> => {
  const headers: any = {};
  if (token) {
    headers["Authentication"] = "Bearer " + token;
  };
  return axios.post(url, data, headers);
};

export const postRequestWithId = (url: string): Promise<AxiosResponse> => {
  const headers: any = {};
  if (token) {
    headers["Authentication"] = "Bearer " + token;
  }
  return axios.post(url, null, headers);
};

export const putRequest = (url: string, data: any): Promise<AxiosResponse> => {
  const headers: any = {};
  if (token) {
    headers["Authentication"] = "Bearer " + token;
  }
  return axios.put(url, data, headers);
};

export const putRequestWithData = (
  url: string,
  data: any
): Promise<AxiosResponse> => {
  const headers: any = {};
  if (token) {
    headers["Authentication"] = "Bearer " + token;
  }
  const config: AxiosRequestConfig = {
    params: data,
    headers: headers,
  };

  return axios.put(url, data, config);
};

export const deleteRequest = (
  url: string,
  data: any
): Promise<AxiosResponse> => {
  const headers: any = {};
  if (token) {
    headers["Authentication"] = "Bearer " + token;
  }

  const config: AxiosRequestConfig = {
    headers: headers,
    data: data,
  };

  return axios.delete(url, config);
};

export const deleteRequestWithData = (
  url: string,
  data: any
): Promise<AxiosResponse> => {
  const headers: any = {};
  if (token) {
    headers["Authentication"] = "Bearer " + token;
  }

  const config: AxiosRequestConfig = {
    headers: headers,
    params: data,
  };

  return axios.delete(url, config);
};

export const deleteRequestWithId = (url: string): Promise<AxiosResponse> => {
  const headers: any = {};
  if (token) {
    headers["Authentication"] = "Bearer " + token;
  }
  return axios.delete(url, headers);
};
