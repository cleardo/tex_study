NAME=text
NAME=exer
NAME=slide
NAME=hy_api_formula01

TYPE=png

DVI=dvipng

#DVI=dvipdf
XE=xelatex -shell-escape

ci:
	svn add *.tex --force
	svn add *.eps --force
	svn add *.pdf --force
	svn ci *.eps -m"eps图片"
	svn ci *.tex -m"文档编写"
	svn ci *.pdf -m"文档编写"

all:
	latex $(NAME).tex
	$(DVI) $(NAME).dvi
	#scp $(NAME)1.$(TYPE) 192.168.94.26:/data/home/linzh/wwwroot/momo.im/test.momo.im/htdocs/tex_output
	#scp $(NAME)1.$(TYPE) 192.168.94.26:/data/home/linzh/wwwroot/momo.im/doc.edu.momo.im/htdocs/华渔API监控系统需求分析/images/
	#scp $(NAME).pdf 192.168.94.26:/data/home/linzh/wwwroot/momo.im/test.momo.im/htdocs/tex_output

xe:
	$(XE) node.tex
	cp node.pdf ~/disk_f/cleardo/wwwroot/latex

code:
	latex -shell-escape code_test.tex

clean:
	rm -rf *.dvi
	rm -rf *.log
	rm -rf *.eps
	rm -rf *.aux
	rm -rf *.ps
	rm -rf *.png

git:
	git add .
	git commit -am"git latex"
	git push origin master
