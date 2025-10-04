# PDBP-PROGRAM
PDBP (Porn and Distraction Blocking Program): a focused digital self-control toolkit that blocks adult content and high-distraction sites, enforces robust browser/system policies, and resists rollback. Suitable for personal or managed deployment. Open source, documented, with a one-click installer. Cross-platform support; actively maintained. Safe.

[TUTORIAL DE IMPLANTAÇÃO — CHROME]
Escopo: Chrome. Versão para Edge em desenvolvimento e será entregue em breve.

1) No Chrome Web Store, instale a extensão BlockP.
2) Dentro da extensão, configure sua lista forte de palavras e sites a bloquear.
3) Feche o Chrome.
4) Execute o script abaixo como Administrador. Ele irá:
   4.1) Forçar a instalação do BlockP pelo ID `llfdaleknghepofjcleahemgndnaghhk` usando a URL oficial de atualização do Web Store. Quando forçada, o usuário não consegue desativar ou remover.
   4.2) Criar todas as chaves de política necessárias em HKLM e HKCU.
   4.3) Travar a edição de Policies (máquina e usuário) com permissão somente leitura para “Todos”.

Observação:
5) Bloquear uma URL específica `chrome-extension://<id>/...` não é granular via `URLBlocklist`; apenas esquemas amplos (ex.: `chrome-extension://*`), o que afetaria todas as extensões.
6) Por isso, use a instalação forçada para impedir desativação e remoção.

[Como executar]
7) Baixe o script único (.bat), coloque em uma pasta e clique com o botão direito → “Executar como administrador”.


[DEPLOYMENT TUTORIAL — CHROME]
Scope: Chrome only. Edge version is in development and will be delivered soon.

1) In the Chrome Web Store, install the BlockP extension.
2) Inside the extension, set a strong list of blocked words and sites.
3) Close Chrome.
4) Run the script below as Administrator. It will:
   4.1) Force-install BlockP by ID `llfdaleknghepofjcleahemgndnaghhk` using the official Web Store update URL. When force-installed, users cannot disable or remove it.
   4.2) Create all required policy keys under HKLM and HKCU.
   4.3) Lock Policies (machine and user) to read-only for Everyone.

Note:
5) `URLBlocklist` cannot target a specific `chrome-extension://<id>/...` URL; it only supports broad schemes (e.g., `chrome-extension://*`), which would affect all extensions.
6) Therefore rely on force install to prevent disable or removal.

[How to run]
7) Download the single .bat script, place it in a folder, then right-click → “Run as administrator”.
