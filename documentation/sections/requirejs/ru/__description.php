<h2 class="item1">Интеграция с Require.js</h2>

<h5>
    Скрипт имеет встроенную поддержку AMD экспорта для интеграции с Require.js. Весь процесс интеграции все также
    сводится к нескольким простым шагам.
</h5>

<h3>
    Скачайте скрипт из Git'a
</h3>

<p>
    Для начала необходимо скачать данный скрипт из нашего публичного репозитория:
    <a href="http://products.git.devoffice.com/coding-development/rd-selectmenu">Кликабельно</a>
</p>


<h3>
    Добавьте необходимую разметку
</h3>

<p>
    HTML разметка по умолчанию для создания параллакса выглядит следующим образом.
</p>

<code>
<pre>
&lt;select class="form-select" name="select" id="select-3"&gt;
    &lt;option value="Option 1"&gt;Option 1&lt;/option&gt;
    &lt;option value="Option 2"&gt;Option 2&lt;/option&gt;
    &lt;option value="Option 3"&gt;Option 3&lt;/option&gt;
    &lt;option value="Option 4"&gt;Option 4&lt;/option&gt;
    &lt;option value="Option 5"&gt;Option 5&lt;/option&gt;
&lt;/select&gt;
</pre>
</code>

<p>
    <strong>Обратите внимание:</strong> класс может быть совершенно любым. Данном примере используется form-select, так как
                                        инициализация скрипта выполняется по данному классу.
</p>


<h3>
    Подключите стили
</h3>

<p>
    Подключите файл стилей rd-selectmenu.css в секции &lt;head/&gt; целевой страницы.
</p>

<code>
<pre>
&lt;link rel="stylesheet" href="path/to/css/rd-selectmenu.css"&gt;
</pre>
</code>

<h3>
    Обновите конфигурацию require.js
</h3>

<p>
    Прежде всего вам нобходимо убедиться в правильности настройки конфигурации путей в require.js. Обязательно необходимо
    определить алиасы jquery и jquery.rd-selectmenu. В большинстве случаев, данная конфигурация определяется в главном скрипте
    приложения, путь к которому определяется в дата атрибуте data-main при подключении require.js
</p>

<code>
<pre>
&lt;script data-main="js/main" src="js/require.js"&gt;&lt;/script&gt;
</pre>
</code>

<p>
    Сама конфигурация должна содержать следующие алиасы для путей
</p>

<code>
<pre>
requirejs.config({
  paths: {
    "jquery": "path/to/jquery"
    "jquery.rd-selectmenu": "path/to/jquery.rd-selectmenu.min.js"
  }
});
</pre>
</code>

<h3>
    Выполните инициализацию скрипта
</h3>

<p>
    Для инициализации скрипта достаточно воспользоваться следующим кодом.
</p>

<code>
<pre>
requirejs(["jquery", "jquery.rd-selectmenu"], function($, select) {
  var o = $(".rd-selectmenu");
  o.RDSelectMenu();
});
</pre>
</code>

