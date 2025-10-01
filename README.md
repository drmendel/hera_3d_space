# HERA 3D SPACE

`hera_3d_space` is the deployment layer for the HERA 3D SPACE project.  
This folder contains the reverse proxy setup that wraps both the two part of the HERA 3D SPACE webapplication:
 - [hera_spice_ws_server](https://github.com/drmendel/hera_spice_ws_server) - WebSocket server serving SPICE data
 - [hera_spice_3d_client](https://github.com/drmendel/hera_spice_3d_client) - Nginx webserver serving static content

The live application can be accessed at: [hera3dspace.dynv6.net](https://hera3dspace.dynv6.net)

## 🎯 Purpose

This repository does **not** provide standalone program features for the application, but it give multiple option for deployment.  
 
Its role is to:
- Hadle SSL/TSL encryption at once
- Route traffic between the client and webserver
- Route traffic between the client and the websocket server
- Wrap the whole web-application in a docker-compose file for easy setup & deployment

## ⚙️ Options

The `docker-compose.yml` file provides multiple options for deploying `HERA 3D SPACE`. The main goal was to be able to set every important parameter from this single file. In order to set the option this file should be changed on the right places.

| Option                | Description                                                                                       |
|-----------------------|---------------------------------------------------------------------------------------------------|
| **DOMAIN_NAME**        | Set to your domain (e.g. `yourdomain.com`) or use `localhost` for local testing. The domain name will be used only in the reverse proxy.       |
| **TLS CERTS** | Mount your TLS private key and certificate to the reverse proxy using `./ssl/key.pem` and `./ssl/cert.pem`. |
| **NGINX CONFIG** | Optional: Provide a custom Nginx config for the reverse proxy by uncommenting the `nginx.conf` volume line. |
| **SYNC_INTERVAL** | Optional: Time (in seconds) between SPICE kernel data syncs in the backend server. |

A local folder can be mounted to persist SPICE kernel data even after the container gets deleted:

```yaml
volumes:
  - ./local_data_folder:/data:rw
```

## <img src="https://cdn.simpleicons.org/docker/2496ED/64" alt="Docker" width="28" style="vertical-align:middle;"> Installation / Docker Deployment
### <img src="https://cdn.simpleicons.org/linux/44AAEE" alt="Docker" width="32" style="vertical-align:middle;"> Linux

---

### 1. Clone the repository: `hera_3d_space`

```bash
git clone https://github.com/drmendel/hera_3d_space.git
```

### 2. Edit the `docker-compose.yml` file

Before launching, review and adjust the configuration if needed. See the **⚙️ Options** section above for full details.   
Do not forget to `add the SSL/TSL key and cert` files. Without these the reverse proxy will not work.

Only these folders/files are needed:
- `data` - store the fetched SPICE data
- `ssl` - store the key and cert files
- `docker-compose.yml` - deploy docker application

Every other file, folder can be deleted if you don't want to modify the code, only use the prebuilt docker images.

### 3. Install `docker` & `docker compose`

```bash
sudo apt update
sudo apt install docker.io docker-compose -y
```

### 4. Enable and start docker service

```bash
sudo systemctl enable docker
sudo systemctl start docker
```

### 5. Deploy the application with a single command

```bash
sudo docker compose up -d
```
To stop the application just run this command in the same folder:

```bash
sudo docker compose down
```

### <img src="https://img.icons8.com/?size=512&id=TuXN3JNUBGOT&format=png" alt="Docker" width="32" style="vertical-align:middle;"> Windows

---

### 1. Download the project

Here is the direct download link: [hera_3d_space](https://github.com/drmendel/hera_3d_space/archive/refs/heads/main.zip)


### 2. Edit the `docker-compose.yml` file

Before launching, review and adjust the configuration if needed. See the **⚙️ Options** section above for full details.   
Do not forget to `add the SSL/TSL key and cert` files. Without these the reverse proxy will not work.

Only these folders/files are needed:
- `data` - store the fetched SPICE data
- `ssl` - store the key and cert files
- `docker-compose.yml` - deploy docker application

Every other file, folder can be deleted if you don't want to modify the code, only use the prebuilt docker images.

### 2. Install `Docker Desktop`

Here is the official link for installing the Docker Desktop applicatioin: [Docker Desktop](https://docs.docker.com/desktop/setup/install/windows-install/). Don't skip any step provided in the documentation because then the Docker Engine might not work.

### 4. Open `Docker Desktop`

Wait until docker engine fires up. If its not happening a restart might help, but also be sure that Docker Desktop is installed properly.

### 5. Start the `docker-compose.yml` file

While Docker Desktop is open, fire up a command line window next to it.
Navigate to the hera_3d_space folder.

```powershell
cd C:\\path\to\hera_3d_space
```
Start the docker application with one command:

```powershell
docker compose up -d
```
The -d flag stands for detached. So we don't see the containers running in the terminal but in the Docker Desktop application.  
To stop the docker application you can use the Dcoker Desktop GUI or the following command in the terminal:

```powershell
docker compose down
```
## 🛰️ Notes

- Internet access is required for ESA kernel synchronization
- Make sure that the host machine has 2x 2 GB free space for storing SPICE data
