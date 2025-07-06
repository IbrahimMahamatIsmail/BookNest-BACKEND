const isProd = process.env.NODE_ENV === 'production';

module.exports = {
  FRONT_URL: isProd
    ? 'https://booknest-front-k9vb6424u-ibrahimmahamatismails-projects.vercel.app'
    : 'http://localhost:3000'
};