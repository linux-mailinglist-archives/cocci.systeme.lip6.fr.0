Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 49DF31A3116
	for <lists+cocci@lfdr.de>; Thu,  9 Apr 2020 10:41:46 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 0398fJ7O018727;
	Thu, 9 Apr 2020 10:41:19 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id A255C7829;
	Thu,  9 Apr 2020 10:41:19 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 104A577FC
 for <cocci@systeme.lip6.fr>; Thu,  9 Apr 2020 10:41:18 +0200 (CEST)
Received: from mout.web.de (mout.web.de [212.227.15.14])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 0398fHrn002689
 (version=TLSv1.2 cipher=DHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO);
 Thu, 9 Apr 2020 10:41:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1586421663;
 bh=Yk+LDJGP3Qme0ozxjoDwuMj3imLHuR5L0BNQ6x2LZac=;
 h=X-UI-Sender-Class:To:Cc:Subject:From:Date;
 b=ZDcvrRLEHy+PZ5fHprX4A23YTXI21cLa5HTK9znhN1jrOnL0AJDBAg8e3cfrCA422
 /VtklYO+HY2a5z2iOCjMZX1r2rJhw+PaD28vddcHDJ8+h7AYgPkYlLWxlHSOemfQ9O
 GxWiL7yRCoIXGkv5brvmHjNaVSMQ6rJBiGwGmGrA=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.3] ([93.133.77.56]) by smtp.web.de (mrweb002
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0MPY1p-1jR7RG2945-004ntn; Thu, 09
 Apr 2020 10:41:03 +0200
To: Alexander Popov <alex.popov@linux.com>, cocci@systeme.lip6.fr,
        kernel-hardening@lists.openwall.com
From: Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <f6175913-560e-d554-cc2d-080b7f6a264b@web.de>
Date: Thu, 9 Apr 2020 10:41:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
Content-Language: en-US
X-Provags-ID: V03:K1:7kMxChmIDzQkuZeNQu7Z6UvyZ7+IlCmAXD3jNqPhm3fAaLZOImK
 VUKqAju8mWHeggKSoPUJ6CR1hE/M+1nG6gbuEulrmugiRO+BO+BaKT0nK0dJfGY1sRrsb8w
 ThXFUTCtHpKffkj43kbgfBBREzrrnlahO3nbzTnBRg67peeD0u/caFnHAbXgeJfbqjoPhc+
 Ip1ZVxa4MamHMlfdUQsIg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:D4CFTFNMRow=:T+WRPFUVuiw7Mfp1wcAeIq
 xDIBPR/A84BOmbw0/KPuYImvEfenv+g8sYm9w8+VtyKrLGPSvzszlZKaah0KHIkPAv9B5WXBD
 nbxixQcvMSFVUrBZtdM+nCG0ZMbvHPRik51zqhi2E9y3/A4ThSj5MmT1apc+yOV4quO77AOgx
 cUFNrDAolGZwre0P3H6/9pUyET+o/KMBhWzJkLWoQIJDrXKkulw0ya5hlS3ZubrAc1aer/2Wr
 49ZCAVCdA1naTbqLRw7CzFmzq88dikic89sX5x2emdfSUdLJ8/NtzoZSFNtZeaodYykhvJ/zO
 7MCHOqB+OBNiJwtP5q0PbtdXMQCTwJcX+Aof0DKGxHpP6/qx2NEX6DjtuUc1+2aHfSYgXcGf2
 9NfjrthRjvzU7QJwiK1Jzao/YO8Eq2Bl+TzAzvQh5HzZ4vyP+yMMXL/cVAMHTCGFEipodsZ5G
 JqaczLrK/Vnksbco3QBNJe+36GZijKn9tHedtTx59CB06BbIJdeO49rJhTve/sZiVV8IenyzQ
 5CS4UucGtKQOOZYyNq4EvgJDUQmlOUa+AGV6ZL1MrXYN9CGgZm1cvueYJg34X4yIFQhdgiD9U
 PwITT1IvFxTljI9moPJiCmxT7A+KjI46tZZPPnlxEXsOKlXyoxS1BqX4eKzrrgZHM1ugvWAks
 9XkVNldo8bkfNrp5m1XXa0MFmj2v64Ve4p/GSlbVEH45eoqwVzErATx6cpsmjM0CStoRSkOo/
 oA5wHUxZfK7Ubicbg1YAIzjwUKP0etDEALa1Db3xEBT6DPR+0eMDWmkwDn97OzY14/tEkNLXS
 oh/RJ42qTJ1nhB9Ffa8q74gHfhPb6NT6qRm0lTmZ650tlujCdc6P9WLgMdKz/G8zobupy609T
 QeutpqPdVlyJxLwaLwV6uEZMKDP29yq5h4u8v0pKpeUX4C2B1cxyiJ8HsxkedaDhglQzhfrBj
 aDoacDcnta9UHIne3p9hvYPdOU7D5ZFgs0rQrasqUVqhbRdKlrRJcWnjmR0U9XL69UjxcR50k
 ZjbiK8fIF6AlBPP9G035Jfht/00oX03yl7Ln/xXk8fddYgkPvh22HExW7p4EwKbsxLFvorzyt
 CONBgNbvvqKAV+mH9IJI7rXrRxkPH88UyJpG/91vB6c/jw+jlTcBYwxzcAqq9OmV+7MdWJ9cn
 EQhGS56Lxx8ySOdGSVy0c6eEse/hDYvfpWAUfIVZCf8OYVDWhMH7VEb6liOwvxlVrBdr2LvmM
 mZtWtWshXF1eJj0ob
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Thu, 09 Apr 2020 10:41:21 +0200 (CEST)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Thu, 09 Apr 2020 10:41:17 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: Michal Marek <michal.lkml@markovi.net>, Kees Cook <keescook@chromium.org>,
        Gilles Muller <Gilles.Muller@lip6.fr>, Jann Horn <jannh@google.com>,
        Nicolas Palix <nicolas.palix@imag.fr>, linux-kernel@vger.kernel.org,
        Hans Verkuil <hverkuil@xs4all.nl>, Julia Lawall <Julia.Lawall@lip6.fr>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Subject: Re: [Cocci] Coccinelle rule for CVE-2019-18683
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

PiBEbyB5b3UgaGF2ZSBhbnkgaWRlYSBob3cgdG8gaW1wcm92ZSBpdD8KCkkgc2VlIGZ1cnRoZXIg
c29mdHdhcmUgZGV2ZWxvcG1lbnQgcG9zc2liaWxpdGllcyBvZiB2YXJ5aW5nIHJlbGV2YW5jZQph
bHNvIGZvciB0aGlzIHNjcmlwdCBvZiB0aGUgc2VtYW50aWMgcGF0Y2ggbGFuZ3VhZ2UuCgoqIFRo
ZSBTbVBMIHZhcmlhYmxlcyDigJxsb2NrX3DigJ0sIOKAnHVubG9ja19w4oCdIGFuZCDigJxzdG9w
X3DigJ0gY291bGQgYmUgZGVjbGFyZWQKICBpbiBhIG1vcmUgc3VjY2luY3Qgd2F5IGp1c3QgYnkg
bGlzdGluZyB0aGVtIGluIHRoZSBzYW1lIHN0YXRlbWVudC4KCiogVGhlIHNvdXJjZSBjb2RlIHNl
YXJjaCBwYXR0ZXJuIGNhbiBiZSB0b28gZ2VuZXJpYy4KICBIb3cgZG8geW91IHRoaW5rIGFib3V0
IHRvIGNvbnNpZGVyIGFkZGl0aW9uYWwgY29uc3RyYWludHMKICBmb3Igc2FmZXIgZGF0YSBjb250
cm9sIGZsb3cgYW5hbHlzaXM/CgoqIE90aGVyIG9wZXJhdGlvbiBtb2RlcyBtaWdodCBiZWNvbWUg
aGVscGZ1bC4KClJlZ2FyZHMsCk1hcmt1cwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpDb2NjaSBtYWlsaW5nIGxpc3QKQ29jY2lAc3lzdGVtZS5saXA2LmZy
Cmh0dHBzOi8vc3lzdGVtZS5saXA2LmZyL21haWxtYW4vbGlzdGluZm8vY29jY2kK
