Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D9083D2C3A
	for <lists+cocci@lfdr.de>; Thu, 10 Oct 2019 16:15:41 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x9AEFPLO028347;
	Thu, 10 Oct 2019 16:15:25 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 602B777C0;
	Thu, 10 Oct 2019 16:15:25 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 3D0FE77AD
 for <cocci@systeme.lip6.fr>; Thu, 10 Oct 2019 16:15:23 +0200 (CEST)
Received: from mout.web.de (mout.web.de [212.227.17.12])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x9AEFMgL016140;
 Thu, 10 Oct 2019 16:15:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1570716922;
 bh=usYf4r0KBm6qtXk2NsxkaZD0Z3VSfblTuUabPNB4oc8=;
 h=X-UI-Sender-Class:Subject:To:References:From:Cc:Date:In-Reply-To;
 b=AEMgVKrc87c3ATCkDO3+Wp+CCBPExt87AIWH0V9FVVlxGPk7Pw0cdEtKAHjltX/9/
 5/d/QLXk5z2a1ZJc+guY/ZxJLjwcLGet6t0Lb2ZJjXnQG4DGGmxBkACYcXaMoINYpY
 lQkxfaHRRz9aW05drh0R7rCu77YCZcafBXu5rxcE=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([93.135.64.254]) by smtp.web.de (mrweb102
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0Lw0uH-1i1w2B0s4j-017nka; Thu, 10
 Oct 2019 16:15:22 +0200
To: Julia Lawall <julia.lawall@lip6.fr>
References: <24130ec6-4a20-7be4-755f-a6dfffcb6c97@web.de>
 <alpine.DEB.2.21.1910101509370.2305@hadrien>
 <8df6513d-36d3-2049-8fb0-28d84c8f9c85@web.de>
 <alpine.DEB.2.21.1910101537280.2305@hadrien>
 <293c83c3-d7b9-8c55-59e0-eaf7fd2fcc84@web.de>
 <alpine.DEB.2.21.1910101606420.2305@hadrien>
From: Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <678d756b-a8ac-12c0-cdbe-96b49fc4eb2c@web.de>
Date: Thu, 10 Oct 2019 16:15:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.1910101606420.2305@hadrien>
Content-Language: en-US
X-Provags-ID: V03:K1:QO/XvpqvVC34hZebZILrwBqMhn3wOXaueNaxB3y0FvgKjBJ8+N2
 iBQv1EVHAXk6kJOUBNz8SiHGzqsMIfTHxADIsa07lhYa/PznAMurkHxx4L2TEl+SZw9wRHh
 d1bVQ4LhnV3GrQ0lO+6RRrkGhda26bIiR8BRbDW2uPSJm4hZRcy3uUB7rvilqztvAHuF+o8
 v/VQmEdRFEDeywJKo0ZSQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Dke/IdFsRHw=:G1EhLY12ZcA5Ec05JzcI4G
 CFGIUqwFiF3n9GqEIdzzwCGBlGFBufkmWVPzU2J572IkMtr3rjaQ1oAGpS1TRZyCwsaFaR3w/
 05t8j1pa4zeHYBrDiOlRj4f3hNzUSp/zSXqgN7i/yebWPAyKfL9WaZZfwwxH1zaz3G82I+48P
 Dlc02wmpu1jiNdY4RY4q/zi1ItIxCdmHVRSalqeOVIQF5uWzMR3bEnSFmnFtra8ysFRvbwZc5
 +AoXfrhOeuJqxbU/pNEZPvobleUD7LPhOHgM888zj+rKTpVya/vU+Kf/cxfmKTJHba/1AqSMS
 uCA5Ui9+Wh1bMaXKPam2Dm0gJRTnDyGJWcTLgFikpLCP2T3sxB9Cd3onCktH2rYd187xbfNa2
 UMgYLMi4et/3d7RfihNxG5NdWT3X3y9HNw8/MHlW3tcWS4zISanuhyITj8W3lfnSrMuwBpJPO
 2N3UjRB0DR+RY+Bi4d74ZepqURiMiEsTtV3QNapcigBRv9187hQA27KrQb9CUmNFHlen5nOuE
 6GHx3riYtkwyGSrglvLVQhWCgm/ETCTmtFLQq5/E4IcMvz6PRg3m/PEeDG3RoWVkxEk3SBA0w
 RbxzLbNWbuT32KZ/apK0BPjs2O5avHHFYog8GoqbFKVUTY4YYncG09dAEh8YoQJHKg9PeV2e1
 2bmA2f8YObOGm68k6w7dlEs8YBkpv4hNhaLt7Y+i4CFMNZOqgiCa9n93R9/lUCjdTKT/kInUW
 pyZ/9ssAtRtxGhtKA4dloALGgNF/0tRv/hOE1sOJ4O2SdJS7hawdTF8ICYvi+kaydtiEWhKR8
 /GmB/SlSWbLhBpUnS+cHDAQs31fqNUw9OT8h6t9112eNUOXuqQvAIqTn82qFFnW+xjXx1H7rP
 tu2GdvJOkdalYQPFNW0LUdwLsJBVj2X+4AFoTtKFixH2noy+smR0oTh8YKtSyWXGfoCdTX2Nc
 aGWuQqtlID8L8vxwr51DLi6b3ooIbARUAK4ZHbGMuaMWeMU1fb0Uihga56CDKIKVFbUYcnNgx
 zi1tUzae1w9O7DD+vNOgzgx8zkzqxwZJxIqc20fMjTa+6sxbgbsxeOwE2vGSTXcluVXtMDTy+
 1+yn77v+1mpab/OvwUSAm8zJOhawHZyQPJZvKbgQyDzVIIDtN+3w/FCrYN8sFHl/i0yasI85B
 8uDQwEnGp9Lju8FB6KwF+fVs3MUYmhhxdDbt3aOm+LJv4uHsfXNiwsWxF97Ciu2kZRWG6fWqM
 cDoLbcA6vCLS8c62de7gbyGT8k5rTGA4VZzHm8QdSAN5dXxYH8KD81PtXTvE=
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Thu, 10 Oct 2019 16:15:25 +0200 (CEST)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Thu, 10 Oct 2019 16:15:22 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: Coccinelle <cocci@systeme.lip6.fr>
Subject: Re: [Cocci] Software analysis with SmPL around unchecked function
 calls
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

Pj4+PiBJIHdvdWxkIGxpa2UgdG8gZGV0ZWN0IHRoYXQgYSBjb3JyZXNwb25kaW5nIG51bGwgcG9p
bnRlciBjaGVjayB3b3VsZCBiZSBtaXNzaW5nCj4+Pj4gKGJlZm9yZSB0aGUgZGF0YSBjYW4gYmUg
dXNlZCBmb3IgZnVydGhlciBkYXRhIHByb2Nlc3NpbmcpLgo+Pj4KPj4+ICogeCA9IGttZW1kdXAo
Li4uKTsKPj4+ICAgLi4uIHdoZW4gIT0geAo+Pj4gKAo+Pj4gICB4LT5mCj4+PiB8Cj4+PiAgIGYo
Li4uLDwrLi4ueC4uLis+LC4uLikKPj4+ICkKPj4KPj4gVGhpcyBTbVBMIHNlYXJjaCBhcHByb2Fj
aCBkb2VzIG5vdCB3b3JrIGFzIGV4cGVjdGVkIGZvcgo+PiB0aGUgbWVudGlvbmVkIHNvdXJjZSBm
aWxlIOKAnGRyaXZlcnMvZ3B1L2RybS9pbXgvcGFyYWxsZWwtZGlzcGxheS5j4oCdLgo+Cj4gSSBo
YXZlIGJldHRlciB0aGluZ3MgdG8gZG8gdGhhbiB0byBydW4geW91ciB0ZXN0cy4gIElmIHlvdSBo
YXZlIGEgcHJvYmxlbSwKPiBzYXkgd2hhdCB0aGUgcHJvYmxlbSBpcyBhbiBzaG93IHRoZSBjb2Rl
IHRoYXQgc2hvd3MgYSBwcm9ibGVtLgoKQSBxdWVzdGlvbmFibGUgc291cmNlIGNvZGUgcGxhY2Ug
aXMganVzdCBub3QgcG9pbnRlZCBvdXQKYnkgdGhpcyBhbmFseXNpcyBhcHByb2FjaC4KTm8gZXJy
b3IgbWVzc2FnZSBpcyBkaXNwbGF5ZWQgb24gbXkgdGVzdCBzeXN0ZW0uCgpTbyBJIHdvdWxkIGFw
cHJlY2lhdGUgdG8gZmluZCBhIGJldHRlciBzb2x1dGlvbiB0b2dldGhlci4KClJlZ2FyZHMsCk1h
cmt1cwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpDb2Nj
aSBtYWlsaW5nIGxpc3QKQ29jY2lAc3lzdGVtZS5saXA2LmZyCmh0dHBzOi8vc3lzdGVtZS5saXA2
LmZyL21haWxtYW4vbGlzdGluZm8vY29jY2kK
