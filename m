Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
	by mail.lfdr.de (Postfix) with ESMTPS id F35B1EC0E8
	for <lists+cocci@lfdr.de>; Fri,  1 Nov 2019 10:57:07 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id xA19urCX004805;
	Fri, 1 Nov 2019 10:56:53 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 21C4B77C0;
	Fri,  1 Nov 2019 10:56:53 +0100 (CET)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 25BA0454C
 for <cocci@systeme.lip6.fr>; Fri,  1 Nov 2019 10:56:52 +0100 (CET)
Received: from mout.web.de (mout.web.de [212.227.17.12])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id xA19upjw008007;
 Fri, 1 Nov 2019 10:56:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1572602211;
 bh=u7mjSCvMVxGfhCcXSyouyoaAyDSrtY022+IxNIppWIk=;
 h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
 b=cZR9cjzJDBTH8JP3xYKioyh9rNOmg2oA4tva6AwgVjzX/fyFG1bOlpSpx8SZoRRsq
 o6Z0K4P4OpxeMSsbpy8v6PPt18SQg4MOZYFwl3uhpH31Pd/Tyx5AoCAzK272DFev2s
 jGs4kukTGl5SmATGQ3F3WbRefgc6wSFbSDj1L7wg=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([93.131.35.66]) by smtp.web.de (mrweb101
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0M0QYD-1i64Xm0Epx-00ucAA; Fri, 01
 Nov 2019 10:56:51 +0100
To: Julia Lawall <julia.lawall@lip6.fr>
References: <708207db-69d7-8962-e507-cd705142d0c4@web.de>
 <226b4ce7-8284-ed03-a478-98e3e532cb15@web.de>
 <08618116-cd93-fedb-f90e-64c17b319794@web.de>
 <alpine.DEB.2.21.1911011037250.2883@hadrien>
From: Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <850f4ae9-3348-08d0-cebf-2cafef8ecdee@web.de>
Date: Fri, 1 Nov 2019 10:56:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.1911011037250.2883@hadrien>
Content-Language: en-US
X-Provags-ID: V03:K1:jbpGBspzBBXTW1WphJ9Rmqh96UuV6yrgTlxtkNFy7WJWt99M+5h
 4AkvtsNF6MfXJ9s67Vu4nMiwWlU2oSH60Vqv3MYMt9my+AKH6bu9zFR3gilUFqS1/QRUYiN
 OBCOxLeAD8+KS1mHs68FHHqe/K8q0qxb7jkVWcs05ltRqHJJ5/qtwxLE5tG+C/GJYUHh022
 A87usK54I+Wh/r9dUG2RQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:xZo4QT1A1Z0=:Vn271ct+ixWqZyP9ioikz3
 9BLZxWTfyRxsrPSi3r4gyFqLXy7Ps5KnXWsTa2CTFrF/3pNlt9OobFo9lsIU6fe/kU2wvXKzo
 VCpsn+ziuAe7UWij7SrvVPtOz/PYX376h2hEL8D1Fh6ZftwQtY3NbwQhjZsOmZI1alwyp/SQl
 733IcpPb+vlvxWWSoGoKKNsR3jnOG1UwifaotsbgzcFY9ZFVmLn87jORykNWuJP0mAmBZrdlD
 nfW58BEqrGBlvqBhLhrGkIxML0mAon3uAcKhN59gEnRYzXXlvcdFRXme5GNuSlswh+Wnehv73
 bwBIvWt9WD78bnG2kqFHP243skNusu/xhmh5S8Ei0hMCjlhlFV/vSsKAdHYL8F+lyWEEJsnkF
 AMepCBqd3Lm/WSUCA72/p1JLP20vM8EYqRy8vYTVMOLsyflZOPi5CGMf+xBkIQuFi9vQodP2V
 mKDOfaL1bszFhxW/D4Zo3Ur3pll3Id5lFsk99XqwZYG4yXx9n4iKWCDlKdymikwd/FpVicV1J
 jFsxWcx6rodowzhd9eCKwlNXmevsARrK/Ifa/xXF1+cSg7bg3FELWWL+6x5dAXD3ijF50aKvm
 4nbQllxZIgE1LyC9SdcvrjdU5IFbRV1d7IX+T4QvO+led5j2c3iEbCkx+4mhlQTIhx4r0uGrs
 12K7nwmREcHcKiBVD9NliZbiiWJEQ47IUax+geXKdKb2VzM8p8Q7yvMW/fQtNQFCz+g2KRMW3
 v1g2c8/+qXOAQxc5YZ1b4EbWXof8ZsyQWg3nc3uJ5eoAM/WFJAYjwUwSL5sYhqpr7Da4QAHVb
 Q5J/aj6S29EkThVPvEEUlg/e+IzFMHgQx1QOqXsxI7n3Sy2pRiG/F9H0IGXEBy7faTbeMM4to
 iJLBnQZ3sPQHChrFhHKpUUcyI00bzr+y9Wfid1ECftxfLteUtiSuLf1M5KxQTuB3xTbCJoBex
 C5WUJq+zLvqJCawBlwwDrsjZCU1tTMLjeTCvjEZWxycEHoih3CdJWRe3jfKQNZtLEMa+1Ka/t
 Eam3j9QN3dPvc09fx+zMS5aLQycfWWEGEFT1X41pjjVV0X4UU0hWsF5fArrmrr5IQJTHdoyCk
 obnOUKZobRnjm3WB6J2hrNdWpCPTPjjfRZRvibWNY1lCKas47Xmyj62bTourXzCSAAuaV3E3o
 PH8p/jHZQBhtoZFkjHvacFrjy8B+2m5YDadj/h50zRo9g9NZxo2e/VuwgfhYrejda2Z3l4vQ3
 kNIzhgEjhEdbXHwwijpcINpy5rXySdimODPPpV+79hVPpV4IJmElvf38Re5A=
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Fri, 01 Nov 2019 10:56:53 +0100 (CET)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Fri, 01 Nov 2019 10:56:51 +0100 (CET)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: Coccinelle <cocci@systeme.lip6.fr>
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

PiBBbmQgdGhlIHVud2FudGVkIHNwYWNlIGNoYXJhY3RlcnMgYXJlIHdoZXJlPwoKQXQgdGhlIGVu
ZCBvZiB0aGUgc2hvd24gdGhyZWUgbGluZXMuCgpXb3VsZCB5b3UgbGlrZSB0byB0cnkgdGhlIGZv
bGxvd2luZyBjb21tYW5kcyBvdXQgb24gdGhlIHVwZGF0ZWQgc291cmNlIGZpbGU/CgoqIGdpdCBk
aWZmIC0tY2hlY2sg4oCmCgogIGRyaXZlcnMvc2NzaS9tZWdhcmFpZC9tZWdhcmFpZF9zYXNfYmFz
ZS5jOjgyNzU6IHRyYWlsaW5nIHdoaXRlc3BhY2UuCuKApgoKKiBzY3JpcHRzL2NoZWNrcGF0Y2gu
cGwgLS10eXBlcyBUUkFJTElOR19XSElURVNQQUNFIC1mIOKApgrigKYKCgo+PiBIb3cgd291bGQg
eW91IGxpa2UgdG8gaW1wcm92ZSB0aGUgcHJldHR5LXByaW50aW5nIGZvciB0aGUgQ29jY2luZWxs
ZSBzb2Z0d2FyZT8KPgo+IEkgZG9uJ3Qga25vdy4KCkkgaG9wZSB0aGF0IHRoaXMgdmlldyB3aWxs
IGNoYW5nZS4KCgo+IEhvdyB3b3VsZCB5b3UgbGlrZSB0byBpbXByb3ZlIHRoZSBwcmV0dHktcHJp
bnRpbmcgZm9yIHRoZSBDb2NjaW5lbGxlIHNvZnR3YXJlPwoKSSB3b3VsZCBsaWtlIHRvIGNsYXJp
Znkgd2hpY2ggc29mdHdhcmUgY29tcG9uZW50cyBpbmZsdWVuY2UgdGhlIGFkZGl0aW9uCm9mIHVu
d2FudGVkIHNwYWNlIGNoYXJhY3RlcnMgKGF0IGxpbmUgZW5kcykuCgpSZWdhcmRzLApNYXJrdXMK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KQ29jY2kgbWFp
bGluZyBsaXN0CkNvY2NpQHN5c3RlbWUubGlwNi5mcgpodHRwczovL3N5c3RlbWUubGlwNi5mci9t
YWlsbWFuL2xpc3RpbmZvL2NvY2NpCg==
