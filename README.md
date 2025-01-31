# Azure Terraform Project

Dieses Projekt demonstriert die Automatisierung einer sicheren Azure-Infrastruktur mithilfe von Terraform. Es dient als Referenzarchitektur für die Bereitstellung grundlegender Netzwerkressourcen unter Einhaltung von Best Practices.

## Projektübersicht

### Zielsetzung
- Bereitstellung einer **modularen und wiederverwendbaren** Azure-Infrastruktur.
- Umsetzung von **Infrastructure-as-Code (IaC)** mit Terraform.
- Integration von **Sicherheitsstandards** (z.B. Network Security Groups).

### Kernkomponenten
| Ressource                | Beschreibung                                                                 |
|--------------------------|-----------------------------------------------------------------------------|
| **Resource Group**       | Container für alle Ressourcen (Region: `West Europe`).            |
| **Virtual Network**      | Netzwerksegmentierung mit Adressraum `10.0.0.0/16`.                         |
| **Subnet**               | Isoliertes Subnetz (`10.0.1.0/24`) für zukünftige Workloads.                |
| **Network Security Group** | Grundlegende Sicherheitsregeln für ein-/ausgehenden Datenverkehr.          |

## Technische Details

### Terraform-Konfiguration
- **Provider**: `hashicorp/azurerm` (Version `>= 4.17.0`).
- **Backend**: Lokale State-Datei (`backend "local"` in `main.tf`).
- **Variablen**: Subscription ID wird über `variables.tf` und `terraform.tfvars` verwaltet.

### Code-Struktur
- `main.tf`: Definiert alle Azure-Ressourcen.
- `variables.tf`: Deklariert Eingabevariablen.
- `.gitignore`: Schützt sensible Dateien (z.B. `*.tfvars`).

### Basisbefehle
| Befehl               | Beschreibung                          |
|----------------------|---------------------------------------|
| `terraform init`     | Initialisiert Provider & Backend.     |
| `terraform apply`    | Erstellt Ressourcen in Azure.         |
| `terraform destroy`  | Löscht alle Ressourcen.               |

## Beispielhafte Bereitstellung
### Ressourcen im Azure-Portal
Nach Ausführung von `terraform apply` werden folgende Ressourcen erstellt:  

![image](https://github.com/user-attachments/assets/6b640e14-7ee3-4c79-af33-bb97a44abb67)
*Abb. 1: Resource Group mit VNet und NSG in West Europe.*
