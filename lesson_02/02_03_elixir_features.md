# Свойства Эликсир

До сих пор мы рассматривали свойства виртуальной машины BEAM. А значит, они общие и для Эликсир, и для Эрланг, и для других языков, которые комплируются в байткод BEAM. Теперь рассмотрим свойства Эликсир, отличающие его от Эрланг.


## Мощная система макросов

Эликсир имеет систему макросов, позаимствованную из Clojure. Особенность этой системы в том, что она работает на уровне абстрактного синтаксического дерева (AST).

Макросы встречаются повсюду. Даже синтаксические конструкции для объявления модулей и функций, для ветвлений и условных переходов являются макросами.

Они позволяют расширять язык и строить Domain Specific Languages (DSL). Яркими примерами таких DSL являются библиотека для работы с базами данных Ecto, и веб-фреймворк Phoenix.

На Эрланг трудно сделать что-то похожее. Попытки создания веб-фреймворков были, но они оказались неудачными. Не хватает гибкости и выразительности языка.


## Эликсир более высокоуровневый язык, чем Эрланг

Ряд конструкций Эликсир не имеет аналогов в Эрланг.

Примером такой конструкции является оператор **pipe**. Это удобный способ написания цепочек вызовов функций, где результат одной функции является аргументом для другой.

Обычно в это случае используют временные переменные:
```
a = func1()
b = func2(a)
c = func3(b)
```
или вложенные вызовы:
```
func3(func2(func1())
```
Но pipe позволяет написать проще и в естественном порядке:
```
func1() |> func2() |> func3()
```

Другим примером является конструкция **with**, которая удобна для цепочки вызовов функций, каждый из которых может вернуть ошибку. With реализует специальный способ обработки ошибок, известный как Railway programming (в функциональном мире известный как do-notation).

Эликсир имеет высокоуровневые абстракции, такие как коллекции (Enum), ленивые коллекции (Streams), протоколы, специальные виды строк Sigils, и абстракции для работы с потоками -- Task и Agent.

Разумеется, Эликсир имеет свои аналоги для всех синтаксических конструкций и всех абстракций, которые есть в Эрланг: функции высшего порядка, конструкторы списков, behaviours, gen_server и др.

В итоге Эликсир обычно требует меньше кода, чем Эрланг, для реализации одинаковых задач.


## Экосистема и сообщество

Несмотря на то, что Эликсир значительно моложе Эрланг, его сообщество крупнее и активнее. Благодаря этому, активнее развивается экосистема: библиотеки и инструменты разработки.

Эрланг -- консервативный язык. Развивается он не быстро. Для команды разработки приоритетом является развитие виртуальной машины, а не языка. (Язык Эрланг и его виртуальная машина разрабатываются одной и той же командой).

Поэтому многие идеи появляются сперва в Эликсир, а потом портируются в Эрланг. Например, инструмент для управления зависимостями и сборкой проекта **mix** является эталоном для аналогичного инструмента **rebar** в Эрланг.
