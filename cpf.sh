#!/bin/bash
cpfHASH=`echo "$1 $2" | python -c "from hashlib import sha1; from hmac import new as hmac; import sys; v=sys.stdin.read().strip().split(' '); print hmac('Sup3RbP4ssCr1t0grPhABr4sil','%s%s' % (v[0],v[1]),sha1).digest().encode('hex')"`

saidA=`curl https://movel01.receita.fazenda.gov.br/servicos-rfb/v2/IRPF/cpf -s -k -H "token: $cpfHASH" -H "plataforma: iPhone OS" -H "dispositivo: iPhone" -H "aplicativo: Pessoa Física" -H "versao: 8.3" -H "versao_app: 4.1" -d "cpf=$1&dataNascimento=$2" 2>&1`

python -c "null=None; a=$saidA; print ''.join(['%s = %s\n' % (c,a[c]) for c in a])"
