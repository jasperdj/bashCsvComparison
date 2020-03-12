---


---

<h1 id="expectations-from-call">Expectations from call</h1>
<ul>
<li>Highly productive and to the point: we focus on getting to the solution as fast as possible.</li>
<li>I will save my additional questions until we’ve reached the end of the meeting. qwe</li>
</ul>
<h1 id="problem-context">Problem context</h1>
<h2 id="my-current-workspace">My current workspace</h2>
<ul>
<li>Input -&gt; the csv files to be compared
<ul>
<li>primary
<ul>
<li>1.csv</li>
<li>2.csv</li>
</ul>
</li>
<li>secundary
<ul>
<li>1.csv</li>
<li>2.csv</li>
</ul>
</li>
</ul>
</li>
<li>Output -&gt; conclusive comparison files to be generated
<ul>
<li>1.csv</li>
<li>2.csv</li>
</ul>
</li>
<li><a href="http://csvcomparison.sh">csvcomparison.sh</a> -&gt; the script I’m working on.</li>
</ul>
<h2 id="examples-of-csv-files-to-be-compared">Examples of csv files to be compared</h2>
<h3 id="primary1.csv">primary/1.csv</h3>
<p>ID;string;number<br>
1;jas;-1<br>
2;;-1000</p>
<h3 id="secundary1.csv">secundary/1.csv</h3>
<p>ID;string;number<br>
1;jas;1<br>
2;per;10<br>
3;jasper;100</p>
<h2 id="brief-summary">Brief summary</h2>
<p>Problem: I need to compare csv files with the same name in different directories on column based level.</p>
<p>Assumption we can make about the csv files:</p>
<ol>
<li>they contain the same unqique columns</li>
<li>are valid csv format</li>
<li>all have the same delimiter</li>
<li>may not have the same amount of rows.</li>
</ol>
<p>Required outcome:</p>
<ol>
<li>For each combination of csv files with the same name I need to generate a conclusive file in ./output/ that contains all csv columns from both csv files.</li>
<li>For each column combination we need to determine whether the value is a number</li>
</ol>
<h2 id="example-of-the-output-file-output1.csv-in-steps">Example of the output file output/1.csv in steps</h2>
<h3 id="step-1-horizonally-concatenation-of-files">Step 1: horizonally concatenation of files</h3>
<p>file;ID;string;number;file;ID;string;number<br>
./input/primary/1.csv;1;jas;-1;./input/secundary/1.csv;1;jas;1<br>
./input/primary/1.csv;2;;-1000;./input/secundary/1.csv;2;per;10<br>
;;;;./input/secundary/1.csv;3;jasper;100</p>
<h3 id="step-2-determine-type-of-each-column-string-or-number">Step 2: determine type of each column (string or number)</h3>
<p>file;ID;string;number;file;ID;string;number;type_ID;type_string;type_number<br>
./input/primary/1.csv;1;jas;-1;./input/secundary/1.csv;1;jas;1;number;string;number<br>
./input/primary/1.csv;2;;-1000;./input/secundary/1.csv;2;per;10;number;string;number<br>
;;;;./input/secundary/1.csv;3;jasper;100;number;string;number</p>
<h3 id="step-3">step 3</h3>

