Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CEE28736E5
	for <lists+cocci@lfdr.de>; Wed, 24 Jul 2019 20:46:45 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x6OIkS9r011576;
	Wed, 24 Jul 2019 20:46:28 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 03A3C778D;
	Wed, 24 Jul 2019 20:46:28 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id E4AB5420D
 for <cocci@systeme.lip6.fr>; Wed, 24 Jul 2019 20:46:25 +0200 (CEST)
Received: from mout.web.de (mout.web.de [217.72.192.78])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x6OIkNrB009329;
 Wed, 24 Jul 2019 20:46:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1563993960;
 bh=Kh2yjH9xVI5lHKmo9C9G06aivcEldrX0v5Weq5gRLV8=;
 h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
 b=RvATu9OipyVIZ5FlBGyrWg0FPFem2PdFej9lI4elbUMBNfbukEgMRxH4UTSIHsDK9
 M1K9E5YdoOUwnqDzyqK6wTPSk49sm2/ZDWqV3b88IVTzjkD5xrnOPqL/M04xsbv4bw
 hRWofsL9Ij9r0JGKrAYo1DCgxawwTOESWu/7V90k=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([93.133.51.56]) by smtp.web.de (mrweb103
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0MHp4r-1hpXKM3FG9-003hP3; Wed, 24
 Jul 2019 20:45:59 +0200
To: Stephen Boyd <swboyd@chromium.org>, Gilles Muller <Gilles.Muller@lip6.fr>,
        Julia Lawall <Julia.Lawall@lip6.fr>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Nicolas Palix
 <nicolas.palix@imag.fr>, cocci@systeme.lip6.fr,
        kernel-janitors@vger.kernel.org
References: <20190723181624.203864-4-swboyd@chromium.org>
 <9b5d8470-dd6e-4358-141f-6b6c40774de1@web.de>
 <5d38a232.1c69fb81.f85f4.67e3@mx.google.com>
From: Markus Elfring <Markus.Elfring@web.de>
Openpgp: preference=signencrypt
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <3ba98738-00a0-4bee-55ab-36127197fb85@web.de>
Date: Wed, 24 Jul 2019 20:45:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <5d38a232.1c69fb81.f85f4.67e3@mx.google.com>
Content-Language: en-US
X-Provags-ID: V03:K1:d3GqKj2OtvfBBvcS+VL5N7Tu7iDTzpClqL/Ad/Wb1VduBqqCrnk
 3Xt047aibAYwxPjvrjAsUoOuzvwvJ6BUvfG6v1xlMXDPzdtPHUeeKjFb20wJRnNyr1Kj/bf
 GLKFgYIqQlo+kC884B6nCvxIU+z9oWaD6MusrItfj7ICZyX8RNmuBXZMM7ChxSp/Qz4Oii1
 6UKcQrfnxO0FE1JTf6GqA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:5KAMM1wmBJY=:OTGGWaMhhE3t0/+i5Mkiy9
 M4QQsrrxrAv3sJJ0J2jWb2YimnLhpjAb0Ql/Q+gvKRxEnPt4VEn8+oH8PpWOodOsd0UOHEmcQ
 +3Wv+rJPtTDY1pUihul2YqoNQ4ARdgTxQhFZbkEDBcLVp0Vu6OsYMxG8uMYe2+xrmfEyhgnef
 UIYRGEStlpNdm8l0cGe6Rf6E4H8CJsmIu9ztGU1fv8SG38MuNc9cXCyV6xvUeZQ2bFyF71eC0
 v9hkumgslpIZJKkB2K92zaXVqtL9frem/4ortV53SSI1tkhFbbaeo8SbyBBlvKNkIvEn5ktcg
 nAKCDvxxQ4gwQiTdun87FEbuBDCyrxmeDKIIcsUUPlmMhSytKFfCUyLT0kdd8BGI54I+LnCwT
 6pk+9IJqwIM/fj/PZYP8eQTkiYL7PezuD6mQwHe5BxIA1mhvKdjOCxcLIkZkabsZJC6sfjNVD
 jUOsVoQUYyUBmuq/Y56ozZZWdrvoz4/3MNaOxXtVaShiRAoq92ZVNnj3B8zNAr3y5BHZHzmnR
 D5fMjHjgWiHHKtBWkYw9/DWK576KgdO4LjZXEB1p5O4nYpycAz5fktmZp8f2zyVLwog/GsJAJ
 gM6mykxryN9PWfVORnt2dUSv/ScF0O+Oa/vD4d6IRvLIP568dGXyle7RLpE6v9lP/5j7ND008
 nyN94fu4EBB7UwmfCpBwssEOftnii6MS/Vpf0+EikbcyN9pqhhbiKKdf92XHq/KCzYFEA+3LL
 Zk2yQS3hEtL2X/OcaRVfxHin7DWlSUEzFcuIWNZH18DvFCbfSdyQDTQrojQK1k9qjbLxkq+q7
 U9iGm40d++8h4FcnlgWiwjM4ZmeRCgiKbkhDOxH7KehcMyvCDkDz3mjm+lYV28ls4bo3bl0vo
 KuKpcICM5oK5SS5AzTJSzmyVBuaBYjgz8/Nykr4Bob9S8ZjODR48SiFsi9FIcbXgtfEO9oiIf
 5VPcy7c6ivXIQ7npszHUoZA/5+51AGA0wQPpSwoOwDqSu9xcn9ybEcsfJZMMxxnvc/fNfCGMD
 7msjHLPmaCnZxEUc1aEgjpe6OYP64fXsuZu8XVYFSozpoW3wkaLXPnUxQciSKR7qP5Wyas5D8
 RMMKmwVON2EETkt9qaF2i9dFeCzWj1YPFm4
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Wed, 24 Jul 2019 20:46:28 +0200 (CEST)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Wed, 24 Jul 2019 20:46:24 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: Rob Herring <robh@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
        linux-kernel@vger.kernel.org,
        Javier Martinez Canillas <javierm@redhat.com>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Mark Brown <broonie@kernel.org>, Russell King <linux@armlinux.org.uk>,
        Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [Cocci] [v4 3/3] coccinelle: Add script to check for
 platform_get_irq() excessive prints
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

Pj4gV2lsbCBmdXJ0aGVyIHNvZnR3YXJlIGRldmVsb3BtZW50IGNvbnNpZGVyYXRpb25zIGJlY29t
ZSBtb3JlIGludGVyZXN0aW5nCj4+IGFsc28gYXJvdW5kIGEgY29udHJpYnV0aW9uIGxpa2Ug4oCc
Q29jY2luZWxsZTogQWRkIGEgU21QTCBzY3JpcHQgZm9yCj4+IHRoZSByZWNvbnNpZGVyYXRpb24g
b2YgcmVkdW5kYW50IGRldl9lcnIoKSBjYWxsc+KAnT8KPj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5v
cmcvbGttbC8yNzQ0YTNmYy05ZTY3LTgxMTMtMWRkOS00MzY2OWUwNjM4NmFAd2ViLmRlLwo+PiBo
dHRwczovL2xvcmUua2VybmVsLm9yZy9wYXRjaHdvcmsvcGF0Y2gvMTA5NTkzNy8KPj4gaHR0cHM6
Ly9sa21sLm9yZy9sa21sLzIwMTkvNy8xLzE0NQo+PiBodHRwczovL3N5c3RlbWUubGlwNi5mci9w
aXBlcm1haWwvY29jY2kvMjAxOS1KdWx5LzAwNjA3MS5odG1sCj4+Cj4KPiBEaWQgdGhpcyBwYXRj
aCBldmVyIGdldCBtZXJnZWQ/CgpOb3QgeWV0LiAtIEkgaG9wZSB0aGF0IHRoaXMgYWRkaXRpb24g
aXMgc3RpbGwgaW4gdGhlIHVzdWFsIHBhdGNoIHJldmlldyBxdWV1ZS4KCgo+IEl0IHNlZW1zIGJl
dHRlciB0byBhbWVuZCB0aGF0IHBhdGNoIGluc3RlYWQgb2YgaW50cm9kdWNlIGFub3RoZXIgb25l
LgoKRnVydGhlciBleHRlbnNpb25zIGNhbiBiZWNvbWUgbW9yZSBjaGFsbGVuZ2luZyBmb3IgdGhp
cyBzb2Z0d2FyZSBhcmVhLgpIb3cgd291bGQgeW91IGxpa2UgdG8gYWRqdXN0IGNvbW1vbiBpbXBs
ZW1lbnRhdGlvbiBkZXRhaWxzPwoKUmVnYXJkcywKTWFya3VzCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkNvY2NpIG1haWxpbmcgbGlzdApDb2NjaUBzeXN0
ZW1lLmxpcDYuZnIKaHR0cHM6Ly9zeXN0ZW1lLmxpcDYuZnIvbWFpbG1hbi9saXN0aW5mby9jb2Nj
aQo=
