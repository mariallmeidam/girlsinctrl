<div style="display: flex; justify-content: center; height: 100%; align-itens: center;">
    <img src="https://github.com/marialmeida1/girls_in_ctrl_tcc/assets/97293831/8295fe88-9b45-4e87-a8fb-e4fcfcf4698c" alt="logo" width="200">
</div>


<h1>Girls in Ctrl - Projeto de Incentivo para Mulheres na Área Tecnológica</h1>
<p>Este projeto tem como objetivo incentivar a participação de mulheres na área tecnológica, um setor predominantemente dominado por homens. O aplicativo foi desenvolvido para oferecer informações valiosas, incluindo notícias sobre tecnologia, oportunidades de emprego, trilhas de aprendizado, iniciativas e acesso a grupos de apoio. Além disso, o aplicativo possui um sistema de notificações para alertar os usuários sobre novas mensagens.</p>

<h2>Tecnologias Utilizadas</h2>
<h3>Frontend</h3>
<ul>
  <li><b>Flutter: </b>Framework utilizado para construir aplicativos mobile híbridos para iOS e Android.</li>
  <li><b>Dart: </b>Linguagem de programação utilizada no desenvolvimento do aplicativo frontend.</li>
</ul>

<h3>Backend</h3>
<ul>
  <li><b>Laravel:</b> Framework utilizado para construir sites completos.</li>
</ul>

<h2>Funcionalidades Principais</h2>
<ul>
  <li><b>Integração com API:</b> O frontend se conecta ao backend por meio de uma API REST para buscar e exibir informações relevantes.</li>
  <li><b>Componentes Reaproveitáveis:</b> Foram criados componentes reutilizáveis, como botões e inputs de pesquisa, para manter um design consistente e eficiente.</li>
  <li><b>Notificações:</b> O aplicativo envia notificações para os usuários quando há novas mensagens ou atualizações relevantes.</li>
</ul>

<h2>Pontos Fortes do Projeto</h2>

<h3>Notificações</h3>
<p>
  As notificações foram um aspecto crucial do projeto, exigindo uma lógica mais elaborada do que outras funcionalidades. Elas consistiam em informar aos usuários sobre novas notícias, obtidas por meio de um feed RSS em tempo real. Para verificar a chegada de novas notícias, implementamos um agendador do Laravel, acionado a cada hora, que verifica a presença de atualizações. Se novas notícias forem detectadas, são enviadas notificações push por meio do Firebase Notifications aos usuários relevantes. Esses registros são mantidos no banco de dados por até sete dias, após os quais são automaticamente excluídos por meio novamente do Agendador de Tarefas do Laravel.
</p>

<h3>Design UX/UI</h3>
<p>A etapa inicial do projeto envolveu a criação do design do aplicativo, visando construir uma interface atraente e interativa para os usuários. Para alcançar esse objetivo, foram desenvolvidos protótipos no Figma, proporcionando uma visão visual da experiência proposta. Abaixo está o link para visualização da interface:
</p>
<a href="https://www.behance.net/gallery/186698995/Design-Aplicativo-UXUI-Girls-in-Ctrl">Link do Projeto no Behance</a>



<h2>Como Contribuir</h2>
<p>Faça um fork do repositório.<br>
Clone o seu fork: <code>git clone https://github.com/marialmeida1/girls_in_ctrl_tcc.git</code><br>
Crie uma branch para sua contribuição: <code>git checkout -b nome-da-sua-branch</code><br>
Faça suas alterações e commit: <code>git commit -m "Sua mensagem de commit"</code><br>
Push para a sua branch: <code>git push origin nome-da-sua-branch</code><br>
Envie um pull request para o repositório original.</p>

<h2>Agradecimentos</h2>
<p>Gostaria de expressar minha sincera gratidão a todos que estiveram ao meu lado nesta jornada. Agradeço profundamente aos meus familiares, amigos e professores por seu apoio constante e por me motivarem a superar desafios a cada dia.</p>
<p>Um agradecimento especial à minha orientadora, cujo compromisso com o meu crescimento profissional e dedicação ao meu trabalho foram fundamentais para meu desenvolvimento. Sua orientação e feedbacks contribuíram significativamente para a evolução do meu projeto.</p>
<p>Também gostaria de estender minha gratidão a todas as mulheres na área de tecnologia. Vocês são verdadeiras inspirações, demonstrando coragem e determinação diante dos desafios do mercado de trabalho. Seu exemplo é um farol de luz e motivação para o meu trabalho.</p>
<p>Obrigado a todos por fazerem parte desta jornada e por contribuírem para o meu crescimento pessoal e profissional.</p>
