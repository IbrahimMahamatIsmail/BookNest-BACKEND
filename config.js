const isProd = process.env.NODE_ENV === 'production';

module.exports = {
  FRONT_URL: isProd
    ? 'https://booknest-front-pn2qapybn-ibrahimmahamatismails-projects.vercel.app'
    : 'http://localhost:3000'
};