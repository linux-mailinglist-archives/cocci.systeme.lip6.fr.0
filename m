Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CD548EC054
	for <lists+cocci@lfdr.de>; Fri,  1 Nov 2019 10:12:53 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id xA19CZRF029919;
	Fri, 1 Nov 2019 10:12:35 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 8AE0777C0;
	Fri,  1 Nov 2019 10:12:35 +0100 (CET)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 01CA2454C
 for <cocci@systeme.lip6.fr>; Fri,  1 Nov 2019 10:12:33 +0100 (CET)
Received: from mout.web.de (mout.web.de [217.72.192.78])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id xA19CX9k003394
 for <cocci@systeme.lip6.fr>; Fri, 1 Nov 2019 10:12:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1572599553;
 bh=F6/lv1HD/QgIQEK4bdN9KXxLlJcXmbZNFYNfXkI9Uek=;
 h=X-UI-Sender-Class:Subject:From:To:References:Date:In-Reply-To;
 b=f9JlK6BSodqVgNXxzGzkM7uTrI4uLLoiMx4I234VcrTYLvfJZSraNyIJlg5PNd2aD
 sCp24ZL+A1TGs0faBrCkdBqLgBBddvM1hvjbQwybukm89xiLXkxlhsE9x8mHhDfkH8
 h7VxrggYIKaH1d8Dmif/e66ap/moZTA9UGBQprHU=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([93.131.35.66]) by smtp.web.de (mrweb103
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0MAMpq-1iEtCt0LJy-00Bfxz for
 <cocci@systeme.lip6.fr>; Fri, 01 Nov 2019 10:12:33 +0100
From: Markus Elfring <Markus.Elfring@web.de>
To: Coccinelle <cocci@systeme.lip6.fr>
References: <708207db-69d7-8962-e507-cd705142d0c4@web.de>
 <226b4ce7-8284-ed03-a478-98e3e532cb15@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <08618116-cd93-fedb-f90e-64c17b319794@web.de>
Date: Fri, 1 Nov 2019 10:12:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <226b4ce7-8284-ed03-a478-98e3e532cb15@web.de>
Content-Language: en-US
X-Provags-ID: V03:K1:dOWsiCDZFh6ipqu9s1vN/YxG5Q51KfF7zc303FQPsWjzIvTSzPE
 YZsjUTF6dyN+I8XXVEa82uXngmS654sto2GUkcj87KltP8LBG2P8MXIuTYKxjdg0JZW4oa1
 9E52LE3RGUgck1VIPm5F4//EXSRG+sRBo3naqUJnjmVL6vu5QDc8PS8uH0n/F7jnquf5gHf
 SXm2dgTPtBMduTuXx5/IQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:H89lmILofOY=:SFASDH4BUMijuH0/b7+26Z
 62jikrUC1zTtCdABVsmloGUfdDRXLU2ygBkDlkBwgmadK8zU0yeNrzjXjnwVIlfqJAvwpFtEN
 ObiwiJE4MosRSo5IYA865011YXF+cL7eMtqy8q55ORZP3tNU7wCpHgs21WIhDji2jEv+VzDv2
 imeRJbSyvwvRM94J9bC1Z6sn8DvjybqC39zzJnheWhwLEqc2qa5DiTkToskFi5VQPYtR7oFpp
 YYZDg74Ube+lhH/KcLvrnuCmHxcKhiCHdiVQh0SEvuhb62O/dtZCrnSxyDf1gQ+Ia9LJIkNvR
 FvSZX2UYKFbklPYSsjusfYwQPZQSwY1DeDLa3oXXD8oDccy3ZNneUWyoEsV0a8J8DEIkSzdu9
 5mb4v49ESCTFLGOxhsQ3Nc/Qyvkq4MQr9IWq80FmjsvEDFl9jIwNofKluYz9sa3nCPzOznPk/
 DQzJAb10rtNQ32OEmcUGTnYwIaZk9aS7HObBoskdnioFl9nkM6N24GsXlFlSPgEx3EpDzgZg6
 Lab4Gd5n24CV0+oZGGE1EsX4bvZmiCNGSWGCHdcgyHCbSUG6elhxd3iEssMmJe0k8d5LyapXo
 6hFG1+/NtsOZlkwHVCbVKiwPPZnua0DKF2vMOQKkuK29B0Uroj9stAqtNLMLPam6XS07RQ6e2
 A+GZGqnqKwyUYqjFCW6NyrZYHS8g5ZbIt09AxrQG1tpUvBFZ+SwQuuZUET0WyjRvusrFMfAh8
 nH4/Tjr5gmJRIZFDnOgQQQeeVUwHBIthLQdVtzR1i7IGe/1QRNDb9SOfMR/k5LCnocbzFB2Vt
 nVaFpl+/cLh2hLbwp6/xSkYtWoE1krFoHcfxd0YICwH1Ig4nYiCUjcGPc9dMjOYHht763VbrR
 s8AAibuFkzLkjorHqKZ7UeqaalHL7ng17vaZNUgfrVupo9I4noGt7fj32Y7eugN4EhaHuZ6na
 mkvjvaLD3SYGHxKIKpfcr9eFemLnAQZSq1uJGFkOIMy3KwdCOdHH08cg8O7IpaVt06unqzxl6
 3qxqNdo7NkH8MH3TLvDUBQH8Pgv7+KBTmb3JNhaVJk9eJ1VwNzPljy4FJUTozctKaaszuaIJ8
 sWxpzdkxVGa+IcjAMiNDW2kiEtp+SyK4QqZPF9WaYMHRdMANuPfEFE+dRH2jdk43DUZS3CGpo
 VB4gObN59FKhP+NGXlAdLdJf6BLf5DiIjZbZxb9PYudDyevw3e7O2NUXdv89vjCuQrUYAhqzM
 vYwgXp77vlkBiaWGv7zM11nA3Y0BfeJVH4cVRMPHycQKrbK0DVWmeM5amFFo=
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Fri, 01 Nov 2019 10:12:35 +0100 (CET)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Fri, 01 Nov 2019 10:12:33 +0100 (CET)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Subject: Re: [Cocci] Checking the occurrence of trailing spaces in a
	semantic patch
X-BeenThere: cocci@systeme.lip6.fr
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: <cocci.systeme.lip6.fr>
List-Unsubscribe: <https://systeme.lip6.fr/mailman/options/cocci>,
 <mailto:cocci-request@systeme.lip6.fr?subject=unsubscribe>
List-Archive: <https://systeme.lip6.fr/pipermail/cocci>
List-Post: <mailto:cocci@systeme.lip6.fr>
List-Help: <mailto:cocci-request@systeme.lip6.fr?subject=help>
List-Subscribe: <https://systeme.lip6.fr/mailman/listinfo/cocci>,
 <mailto:cocci-request@systeme.lip6.fr?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: cocci-bounces@systeme.lip6.fr
Errors-To: cocci-bounces@systeme.lip6.fr

PiBUaGUgZm9sbG93aW5nIFNtUEwgc2NyaXB0IHZhcmlhbnQgY2FuIGdlbmVyYXRlIGFuIHVzYWJs
ZSB0ZXN0IHJlc3VsdC4KClllc3RlcmRheSBJIG5vdGljZWQgZHVyaW5nIHRoZSBwcmVwYXJhdGlv
biBvZiBhIGNvcnJlc3BvbmRpbmcgY29tbWl0CnRoYXQgdW53YW50ZWQgc3BhY2UgY2hhcmFjdGVy
cyB3ZXJlIGFkZGVkIGF0IHRocmVlIHBsYWNlcyBpbiB0aGUgZ2VuZXJhdGVkIHBhdGNoLgoKZWxm
cmluZ0BTb25uZTp+L1Byb2pla3RlL0xpbnV4L25leHQtcGF0Y2hlZD4gc3BhdGNoIC0taW4tcGxh
Y2UgZHJpdmVycy9zY3NpL21lZ2FyYWlkL21lZ2FyYWlkX3Nhc19iYXNlLmMgfi9Qcm9qZWt0ZS9D
b2NjaW5lbGxlL2phbml0b3IvbW92ZV9lcnJvcl9jb2RlX2Fzc2lnbm1lbnRfdG9fZnVuY3Rpb25f
ZW5kMi5jb2NjaQoKZ2l0IEdVSToK4oCmCkBAIC04MjcwLDMxICs4MjcwLDI0IEBAIHN0YXRpYyBp
bnQgbWVnYXNhc19tZ210X2lvY3RsX2Z3KHN0cnVjdCBmaWxlICpmaWxlLCB1bnNpZ25lZCBsb25n
IGFyZykK4oCmCisJaWYgKCFpbnN0YW5jZSkK4oCmCisJaWYgKGluc3RhbmNlLT5yZXF1ZXN0b3JJ
ZCAmJiAhYWxsb3dfdmZfaW9jdGxzKQrigKYKKwlpZiAoaW5zdGFuY2UtPnVubG9hZCA9PSAxKQri
gKYKCgpIb3cgd291bGQgeW91IGxpa2UgdG8gaW1wcm92ZSB0aGUgcHJldHR5LXByaW50aW5nIGZv
ciB0aGUgQ29jY2luZWxsZSBzb2Z0d2FyZT8KClJlZ2FyZHMsCk1hcmt1cwpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpDb2NjaSBtYWlsaW5nIGxpc3QKQ29j
Y2lAc3lzdGVtZS5saXA2LmZyCmh0dHBzOi8vc3lzdGVtZS5saXA2LmZyL21haWxtYW4vbGlzdGlu
Zm8vY29jY2kK
