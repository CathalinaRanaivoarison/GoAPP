# Utiliser l'image officielle de Go
FROM golang:1.21

# Définir le répertoire de travail dans le conteneur
WORKDIR /app

# Copier le fichier go.mod (pas besoin de go.sum s'il n'existe pas)
COPY webapi/go.mod ./

# Télécharger les dépendances
RUN go mod tidy

# Copier le code source de l'application
COPY webapi/ .

# Compiler l'application
RUN go build -o app main.go

# Exposer le port sur lequel l'application tourne
EXPOSE 8081

# Démarrer l'application
CMD ["/app/app"]
