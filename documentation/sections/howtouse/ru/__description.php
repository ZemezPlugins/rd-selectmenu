<h2 class="item1">Как использовать</h2>

<h5>
    Внедрение скрипта на страницу сводится к нескольким простым шагам.
</h5>

<p>
    <strong>Обратите внимание:</strong> предложенный вариант инициализации может отличаться в зависимости от продукта,
    в котором он внедряется. Информация предоставленная ниже лишь отображает принципы работы со скриптом.
</p>

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
    HTML разметка по умолчанию выглядит следующим образом.
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
    Подключите скрипт на странице
</h3>

<p>
    Вам необходимо скоппировать скрипт в папку /js вашего проекта и выполнить его подключение на странице. Для это можно
    исспользовать следующий участок кода:
</p>

<code>
<pre>
&lt;script src="js/rd-selectmenu.min.js"&gt;&lt;/script&gt;
</pre>
</code>


<h3>
    Выполните инициализацию скрипта
</h3>

<p>
    Вам необходимо выполнить инициализацию скрипта для элементов по целевому селектору, с помощью следующего участка кода
</p>

<code>
<pre>
&lt;script&gt;
  $(document).ready(function () {
    o.RDSelectMenu(); // Additional options
  });
&lt;/script&gt;
</pre>
</code>

