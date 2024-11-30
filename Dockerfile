# Gunakan image Node.js Alpine untuk mengurangi ukuran image
FROM node:16-alpine

# Tetapkan direktori kerja
WORKDIR /app

# Salin file package.json dan yarn.lock ke dalam container
COPY package*.json ./

# Instal dependensi
RUN yarn install

# Salin seluruh kode aplikasi ke container
COPY . .

# Tetapkan variabel lingkungan untuk production (opsional)
ENV NODE_ENV=production

# Build aplikasi (jika untuk production)
RUN yarn build

# Pastikan port 3000 terbuka
EXPOSE 3000

# Jalankan aplikasi (gunakan "dev" untuk pengembangan)
CMD ["yarn", "start"]
