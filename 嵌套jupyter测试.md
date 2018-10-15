+++
title = "嵌套jupyter测试"
date = 2018-02-28T18:08:43+08:00
tags = [""]
categories = [""]
draft = false
+++

  <div tabindex="-1" id="notebook" class="border-box-sizing">
    <div class="container" id="notebook-container">

<div class="cell border-box-sizing text_cell rendered"><div class="prompt input_prompt">
</div>
<div class="inner_cell">
<div class="text_cell_render border-box-sizing rendered_html">
<h1 id="Hello-World">Hello World<a class="anchor-link" href="#Hello-World">&#182;</a></h1>
</div>
</div>
</div>
<div class="cell border-box-sizing text_cell rendered"><div class="prompt input_prompt">
</div>
<div class="inner_cell">
<div class="text_cell_render border-box-sizing rendered_html">
<h2 id="A-simple-operation">A simple operation<a class="anchor-link" href="#A-simple-operation">&#182;</a></h2>
</div>
</div>
</div>
<div class="cell border-box-sizing code_cell rendered">
<div class="input">
<div class="prompt input_prompt">In&nbsp;[&nbsp;]:</div>
<div class="inner_cell">
    <div class="input_area">
<div class=" highlight hl-ipython3"><pre><span></span><span class="kn">import</span> <span class="nn">numpy</span> <span class="k">as</span> <span class="nn">np</span>
</pre></div>

</div>
</div>
</div>

</div>
<div class="cell border-box-sizing code_cell rendered">
<div class="input">
<div class="prompt input_prompt">In&nbsp;[18]:</div>
<div class="inner_cell">
    <div class="input_area">
<div class=" highlight hl-ipython3"><pre><span></span><span class="n">arr</span> <span class="o">=</span> <span class="n">np</span><span class="o">.</span><span class="n">arange</span><span class="p">(</span><span class="mi">2</span><span class="p">,</span> <span class="mi">10</span><span class="p">)</span>
<span class="n">arr</span>
</pre></div>

</div>
</div>
</div>

<div class="output_wrapper">
<div class="output">

<div class="output_area">

<div class="prompt output_prompt">Out[18]:</div>

<div class="output_text output_subarea output_execute_result">
<pre>array([2, 3, 4, 5, 6, 7, 8, 9])</pre>
</div>

</div>

</div>
</div>

</div>
<div class="cell border-box-sizing code_cell rendered">
<div class="input">
<div class="prompt input_prompt">In&nbsp;[22]:</div>
<div class="inner_cell">
    <div class="input_area">
<div class=" highlight hl-ipython3"><pre><span></span><span class="n">arr</span> <span class="o">=</span> <span class="n">arr</span><span class="o">.</span><span class="n">reshape</span><span class="p">(</span><span class="mi">2</span><span class="p">,</span> <span class="mi">2</span><span class="p">,</span> <span class="mi">2</span><span class="p">)</span>
<span class="n">arr</span>
</pre></div>

</div>
</div>
</div>

<div class="output_wrapper">
<div class="output">

<div class="output_area">

<div class="prompt output_prompt">Out[22]:</div>

<div class="output_text output_subarea output_execute_result">
<pre>array([[[2, 3],
        [4, 5]],

       [[6, 7],
        [8, 9]]])</pre>

</div>

</div>

</div>
</div>

</div>
    </div>
  </div>
