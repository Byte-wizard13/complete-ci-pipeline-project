# 1. Base Image निवडणे (Lightweight alpine image)
FROM node:18-alpine

# 2. कंटेनरच्या आत कामाची डिरेक्टरी तयार करणे
WORKDIR /usr/src/app

# 3. डिपेंडन्सी फाईल्स कॉपी करणे
COPY package*.json ./

# 4. डिपेंडन्सी इन्स्टॉल करणे (Production साठी केवळ आवश्यक पॅकेजेस)
RUN npm install --only=production

# 5. सर्व कोड कंटेनरमध्ये कॉपी करणे
COPY . .

# 6. ॲप्लिकेशनचा पोर्ट उघडणे
EXPOSE 3000

# 7. ॲप सुरू करण्याची मुख्य कमांड
CMD ["npm", "start"]
