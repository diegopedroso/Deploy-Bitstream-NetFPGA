## RC Deploy Bistream NetFPGA Rack


Para que os elementos reprogramáveis de plano de dados baseados em FPGA e PISA operem adequadamente no testbed é necessário que os respectivos projetos sejam compilados. 


### Requisitos

* Projeto da arquitetura da placa em Verilog
* Ruby 2.2 ou superior
* OMF EC

### Visão Geral (VMs)

Ocorre que, o processo de compilação dos projetos utilizando um hardware comum ou qualquer uma das máquinas do testbed é muito demorado. Portanto, criou-se um controlador para era direcionar uma thread para um servidor com um  hardware dedicado a esse tipo de função, de modo que este realizaria a compilação em um intervalo de tempo menor do que as máquinas do ambiente de experimentação.

Siga as seguintes instruções para fazer o upload do seu projeto para compilação.

> Compacte o seu projeto em um arquivo do tipo tar.gz com o comando. O nome informado no arquivo deve ser o mesmo referenciado dentro do script deploy.rb

```bash
$ tar -czvf seu_projeto.tar.gz
```
> Copie o arquivo para o mesmo diretório do arquivo deploy.rb, e execute o comando abaixo

```bash
$ omf_ec deploy.rb
```
> Dentro de alguns minutos o controlador vai compilar o projeto completo, e vai retornar um arquivo do tipo bitstream, que tem a extensão (.bit)

---


Para mais informações acesse: <br>
[fibre.org.br](https://fibre.org.br/)
