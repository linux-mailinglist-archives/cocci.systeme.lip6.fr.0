Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DC1225AD15
	for <lists+cocci@lfdr.de>; Sat, 29 Jun 2019 21:32:52 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x5TJVUuL002747;
	Sat, 29 Jun 2019 21:31:30 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 1DB627786;
	Sat, 29 Jun 2019 21:31:30 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 7493C7770
 for <cocci@systeme.lip6.fr>; Sat, 29 Jun 2019 21:31:28 +0200 (CEST)
Received: from mout.web.de (mout.web.de [212.227.17.11])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x5TJVQXr016242;
 Sat, 29 Jun 2019 21:31:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1561836657;
 bh=vo09pSRaTUToqgbIQsisTZIbBb/GsNi3fYXSBbYUNvY=;
 h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
 b=SlBhBx4PZ1yW3qEEC5K6EoaoEyQsHjshkOJsJNIGMqJoOMe5dyyPxctqsm6x4iuz9
 Ozk1Oq2Fq/qt3D9GABGCZ0dVjK4w1Z/hYKBPOijpJGQ4mI9vBumgaaRIK+aMYtAOkE
 eluvE3A+RTJi6PM8xkgDXDzeYbpi3ods5MpzpQ64=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([93.132.176.71]) by smtp.web.de (mrweb102
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0LmLc6-1iForj1cWo-00a1Ge; Sat, 29
 Jun 2019 21:30:57 +0200
To: Julia Lawall <julia.lawall@lip6.fr>, cocci@systeme.lip6.fr
References: <1561690732-20694-1-git-send-email-wen.yang99@zte.com.cn>
 <904b9362-cd01-ffc9-600b-0c48848617a0@web.de>
 <76641efc-2e3e-8664-03b2-4eb82f01c275@web.de>
 <alpine.DEB.2.21.1906290947470.2579@hadrien>
From: Markus Elfring <Markus.Elfring@web.de>
Openpgp: preference=signencrypt
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <03cc4df5-ce7f-ba91-36b5-687fec8c7297@web.de>
Date: Sat, 29 Jun 2019 21:30:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.1906290947470.2579@hadrien>
Content-Language: en-GB
X-Provags-ID: V03:K1:bAbEiUkVH6AWjmazL1j3eSonWoKkra6CEa1YhyXXbqr62Cs/VVf
 /c84YC2KO82h8Mor5ct/2pH/nVPQGXMlGePgGAyGc2qjl5D+M+RODUZB/XBHVcd5kNXUFJB
 2+mbMOmOF3qclxlDZKz1zSdH97cW+nitmKuX99ZgN8Ik2LnqpTuaC3BUyANjDr1gS5NrL00
 J3VWsx0znC9SEpsfBbmGg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:BJdMmP+hHys=:vCYf21pdbTcmwUfH7Bz0Bk
 JKZNdxNTV9i3vbl+iunnUCpR0afcOwE/xMry/XLgiCBR7G6HWC47heNYuyGcE0YE6ZJuzz1uk
 K0FN2NxnG25YW1WwOl7G9WBoBmRU3yPt0360bn511yGM1UBgjZtZ3TKr1EStxn2YMtNq+XeRj
 C5LslQ6KD3QRkD/B+S959B/2jPWgZHVuZfh1opg9bdc//j2V0wuJzjBi+GDFsjoo07YcdDJOS
 g39qy82LnLjIJ12Eo44uYn8qpJEv68C9DvYExHBZj5pXGUNp8vyaI0GyhbZ9sFLS7QJfsR2zh
 /CKu7myqz5r56k8JFOhDtlhkv5IfaynNhrmhJok0/rj9xgnVWnIjKdHuqsaAY8Y0+17Au0mLD
 qL5G+hHOfPlkPseIBiDjAOqwgwkSuEXVAsSMBJCjQlbkYZQPJfLcjkQqw5uENfkZsRYj275lb
 DLAPrK/Hr6jCYKbs77qaVzO75djvTAJbn7gI0vVoBdxHL2aj90vgL+llwyWC/E8WdfB0AeiGG
 klNqRtFAjZQ3QD2gdWXpFWnFLnWzFNGxXqF0GJlUy933Aqc8tstaAlijpVxIV2opXl7okjX7E
 RsSREOsGcpds/87+IPj2LkoNgSU9ndCVyk17mLkrUrqGSehWpJRnFOolL5b854K0qOWYmIzW5
 T2EpBa+s2kV1jUEe2/cTc832Y+/AbVS21ncuxviCZRsCK2h12rCL+u2F6Wa2ASGIyaYyF+l1J
 K72BQ9GyMDhZXeA84cU8EqmFvIU6vT/R9RuVFaYCE3pNxkdoopxCmeExpD8CGpN4lVEKVMCbf
 1vYGVbDgG55bIJ3rfBrCiXcyAe8NDKNmuEBHVcnZWsl2RZPETloOTxau8lGdrZLzhik32TJMv
 62qp6+8svNWcyNrTIRIxGfkiw61K+dTXQs+2MGzYbvX72o9ngdigk1Ppz3aqiaKLldH6jhS4J
 Fipv4zVOvPrYgsnVPT/JjXFcezpa6wQAbMKXf6F4SufX+oxKZ7qRwoDDsqNXEzOXHL9QlXY4x
 owbQKRwftZH2HHJEN/JwXP01eyOOXk6IHHJCKW3g87AfXC6irVIsa3cleP6ymbr1rwhVZLrd+
 S0ZdY9Z3Hz2nsbAF5BoTkluqLbCXSTOokii
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Sat, 29 Jun 2019 21:31:33 +0200 (CEST)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Sat, 29 Jun 2019 21:31:26 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: Yi Wang <wang.yi59@zte.com.cn>, Michal Marek <michal.lkml@markovi.net>,
        Nicolas Palix <nicolas.palix@imag.fr>, linux-kernel@vger.kernel.org,
        Wen Yang <wen.yang99@zte.com.cn>
Subject: Re: [Cocci] [v2] Coccinelle: Testing SmPL constraints
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

PiBQbGVhc2UgYWN0dWFsbHkgdHJ5IHRoaW5ncyBvdXQgYmVmb3JlIGRlY2xhcmluZyB0aGVtIHRv
IGJlIHVzZWxlc3MuCgpUaGlzIGZlZWRiYWNrIHByb3ZpZGVzIGFsc28gYW5vdGhlciBvcHBvcnR1
bml0eSBmb3IgY29sbGF0ZXJhbCBldm9sdXRpb24KaW4gc29tZSBkaXJlY3Rpb25zLiBJIGFtIGN1
cmlvdXMgb24gaG93IGludm9sdmVkIHVuY2VydGFpbnR5IGNhbiBiZSBmaXhlZCBhcm91bmQKcG9z
c2libHkgZGlmZmVyZW50IGludGVycHJldGF0aW9uIGZvciBwcm92aWRlZCBzb2Z0d2FyZSBmdW5j
dGlvbmFsaXR5LgoKVGhlIFNtUEwgY29uc3RydWN0IOKAnC4uLiB3aGVuIOKApuKAnSBpcyBtZW50
aW9uZWQgaW4gYW4gYXJlYSAob2YgdGhlIHNlY3Rpb24K4oCcQmFzaWMgdHJhbnNmb3JtYXRpb25z
4oCdIGluIHRoZSBzb2Z0d2FyZSBkb2N1bWVudGF0aW9uKSB3aGljaCBpcyBpbnRyb2R1Y2VkIHdp
dGgKdGhlIHdvcmRpbmcg4oCcVGhlIGdyYW1tYXIgZm9yIHRoZSBtaW51cyBvciBwbHVzIHNsaWNl
IG9mIGEgdHJhbnNmb3JtYXRpb24gaXMKYXMgZm9sbG93czrigJ0uCmh0dHBzOi8vZ2l0aHViLmNv
bS9jb2NjaW5lbGxlL2NvY2NpbmVsbGUvYmxvYi9jNmQ3NTU0ZWRmN2M0NjU0YWVhZTRkMzNjM2Yw
NDBlMzAwNjgyZjIzL2RvY3MvbWFudWFsL2NvY2NpX3N5bnRheC50ZXgjTDEwMzMKCkkgZ290IHRo
ZSBpbXByZXNzaW9uIHRoYXQgdGhlIGNvcnJlc3BvbmRpbmcgbWVhbmluZyBpcyBub3QgZXhwbGFp
bmVkIGluIHRoaXMKaW5mb3JtYXRpb24gc291cmNlIHNvIGZhci4KVGhlIHB1Ymxpc2hlZCBleGFt
cGxlIOKAnFJlZmVyZW5jZSBjb3VudGVyOiB0aGUgb2ZfeHh4IEFQSeKAnSBjYW4gYmUgaW50ZXJl
c3RpbmcKdGhlbiB0byBzb21lIGRlZ3JlZSBmb3IgdGhlIGV4cGxhbmF0aW9uIG9mIHRoZSBkaXNj
dXNzZWQgZGV2ZWxvcG1lbnQgZWZmb3J0cy4KaHR0cHM6Ly9naXRodWIuY29tL2NvY2NpbmVsbGUv
Y29jY2luZWxsZS9ibG9iLzE3NWRlMTZiYzdlNTM1YjZhODlhNjJiODFhNjczYjBkMGNkNzA3NWMv
ZG9jcy9tYW51YWwvZXhhbXBsZXMudGV4I0wzMjAKCklmIHRoZSBhdmFpbGFibGUgYXBwbGljYXRp
b24gZG9jdW1lbnRhdGlvbiBpcyBzdGlsbCB0b28gbGltaXRlZCAoYW5kIGluY29tcGxldGUKYmVj
YXVzZSBpdCBpcyBhbHNvIHdvcmsgaW4gcHJvZ3Jlc3MpLCBpdCBpcyBwcm9iYWJseSB1c3VhbCB0
aGF0IFNtUEwgY29kZQpvY2Nhc2lvbmFsbHkgdHJpZXMgdG8gZXhwcmVzcyBleHBlY3RhdGlvbnMg
d2hpY2ggYXJlIG5vdCBjb3ZlcmVkIGJ5IGFuIGV2b2x2aW5nCnNvZnR3YXJlIGltcGxlbWVudGF0
aW9uLgpIb3cgd291bGQgeW91IGxpa2UgdG8gaW1wcm92ZSB0aGUgc2l0dWF0aW9uIGZ1cnRoZXI/
CgoqIElzIGl0IGNlcnRhaW4gdGhhdCBhIHNlYXJjaCBpcyBwZXJmb3JtZWQgb25seSBmb3IgdGhl
IHNvdXJjZSBjb2RlIOKAnHggPT0gTlVMTOKAnQogIChhbmQgY29ycmVzcG9uZGluZyBpc29tb3Jw
aGlzbXMpIGJ5IHRoZSBTbVBMIGNvbnN0cmFpbnQg4oCcd2hlbiAhPSB0cnVl4oCdCiAgKGFmdGVy
IGEgc3VjY2Vzc2Z1bCBudWxsIHBvaW50ZXIgY2hlY2sgd2FzIGRldGVjdGVkIGluIHRoaXMgdXNl
IGNhc2UpPwoKKiBXb3VsZCB5b3UgbGlrZSB0byB0ZXN0IGFueSBmdW5jdGlvbmFsaXR5IHdoaWNo
IHNob3VsZCB3b3JrIGluIGRpZmZlcmVudCB3YXlzCiAgdGhhbiB5b3UgbWlnaHQgc2VlIGZyb20g
dGhlIG9yaWdpbmFsIE9DYW1sIHNvdXJjZSBjb2RlPwogIGh0dHBzOi8vZ2l0aHViLmNvbS9jb2Nj
aW5lbGxlL2NvY2NpbmVsbGUvaXNzdWVzLzEzNAoKUmVnYXJkcywKTWFya3VzCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkNvY2NpIG1haWxpbmcgbGlzdApD
b2NjaUBzeXN0ZW1lLmxpcDYuZnIKaHR0cHM6Ly9zeXN0ZW1lLmxpcDYuZnIvbWFpbG1hbi9saXN0
aW5mby9jb2NjaQo=
