Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
	by mail.lfdr.de (Postfix) with ESMTPS id F266118699
	for <lists+cocci@lfdr.de>; Thu,  9 May 2019 10:12:29 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
          by isis.lip6.fr (8.15.2/lip6) with ESMTP id x498BMnp026586
          ; Thu, 9 May 2019 10:11:22 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 950CB774B;
	Thu,  9 May 2019 10:11:22 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 6C6057739
 for <cocci@systeme.lip6.fr>; Thu,  9 May 2019 10:11:21 +0200 (CEST)
Received: from mout.web.de (mout.web.de [217.72.192.78])
 by isis.lip6.fr (8.15.2/lip6) with ESMTP id x498BFT6024679
 ; Thu, 9 May 2019 10:11:15 +0200 (CEST)
X-pt: isis.lip6.fr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1557389459;
 bh=C6VrNUr3KSKlna0pY1MdZrQdH3t43UtamDaNsAwYX9M=;
 h=X-UI-Sender-Class:Subject:Cc:References:To:From:Date:In-Reply-To;
 b=NnHwrUhXt43StzTiAeFSHr0hxkbkg2hvi3WVisIcwUyXRYlIaXW/4mG1sGnk7niEg
 R6lajH0tlosCX8HiKaArgdj94VNFeJU5Mui4fVsRngbQI6b5KcZpvKqthQEsqI9ynO
 U8YxeN3RyItZdH0FCLnzIiYUej0a8Z6RWNN+oL10=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.3] ([78.49.6.113]) by smtp.web.de (mrweb101
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0Ltnmz-1ghEs349G1-011CBE; Thu, 09
 May 2019 10:10:59 +0200
References: <201905090947015772925@zte.com.cn>
To: Wen Yang <wen.yang99@zte.com.cn>, cocci@systeme.lip6.fr
From: Markus Elfring <Markus.Elfring@web.de>
Openpgp: preference=signencrypt
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <141163ed-a78b-6d89-e6cd-3442adda7073@web.de>
Date: Thu, 9 May 2019 10:10:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <201905090947015772925@zte.com.cn>
Content-Language: en-GB
X-Provags-ID: V03:K1:VOV3WvEGfkxwV7iT1XhUEiLOH6hfXaL9ulbvLGoAkL1fJmZWYbz
 gY50LqPyYRL7sXDi0f6ZHQ3yJD2c7jxTzmRI3LSuJTyAio4XGfWaZHWG0pGRyH4mxA73Is+
 wf//OtmzB7Qlkq8Tnb3KAqh1LZTDmt4RnAd34JVKndFBXNmn4BfKNF/xYzLTZL4BumvfmmS
 bIebnePIhpDVZQSrpRDLQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:PT9in4O+5Wc=:4bgd73Uy3tlkeMl/Uo7J+h
 LJGqs0xkH8nNwt3WX7nLZlDafIzX/DkrVW1GEp74UAxKzqdAVTttwBahgIIIek6uSkRLvpojS
 zXgKxwD+uPkr/mAb9W7z/wPpBbbuBzmnnhg0v8sQEvkOiQVFi+cz2kgv3hbEtqceoV61gDt0s
 sknzO1Zx1xAAS2aLx02lgzALnhNpgARuyAc7+TKpd/ntUP8CMv+roxDIb76Oic/YLKTa//UDe
 d04jVekY24fw3lb/2HLC+LURpMl8LtxqT4SFfrtJQr1OnDFCxWlEohZoQPTF/nJ76OWK+pjNH
 ulvRBIs2NYp6CZ0p2Rxj6ay0RYzVhJAMwnUwHOPgHJXlw3UhjY6VVISvhn1nQ4xRyXgxnDwIm
 xW0ht8gIjp7tfXl3ItqX78uktnh2fnptoLq8sJaG9aGk6yVmeB8+k/f/aN1ZWvd3Zo1HLYLrZ
 OOWjNNR9w4oKIblVfVZnhzlpmkDKL0N15Tl9hXW5R2h5Z28YR39LE9wuO8KSXujuiChJ1F7Lc
 FTFx65FV0e/DArjpoJAjknMZ7zspUYKuJrweKsfYxZN2hAIbzjMi6Kua14ARFAkxAtURpNKO9
 vWw4Gnf5FFNZ0KLPdtYCrRSEZ/zNX2+bIAOb3JxRuR/tTbMT+gq4Uj8FHa4GA8cfeD0pF9UEG
 LmU9Pp4WtzPhQJNzSL/PN9ZJGuJvIvj7gWG66W0RxD8YK+mpDf2yV4p6zeGwpun96OaFyjNh6
 Qlto9O/f8xlR/G0t+MKD2hgFWxazldTp39f7VGegzHYVfl350HCykaAlFjnt8QHayBBFFXG0D
 4PfM2tB04P6J7vq4ANDXpTu7YVuc7eQuNE0sz2mENmFCunAByou51R30C6OKm4TsfVXSjzYUf
 rrAzVx16eOK2eR/G6FJEYML0NLeZ0OBBSvnGJEs/y9Ge1HCwoMltKigHe56WnhZPOBd5v/l+o
 v3PTK9DQMYg==
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Thu, 09 May 2019 10:11:23 +0200 (CEST)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Thu, 09 May 2019 10:11:15 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: Yi Wang <wang.yi59@zte.com.cn>, Michal Marek <michal.lkml@markovi.net>,
        Nicolas Palix <nicolas.palix@imag.fr>, linux-kernel@vger.kernel.org
Subject: Re: [Cocci] Coccinelle: semantic patch for missing of_node_put
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

PiBJdCdzIGludGVyZXN0aW5nIHRvIGdldCB0aGUgZnVuY3Rpb24gbGlzdCBhdXRvbWF0aWNhbGx5
LgoKSSBvY2Nhc2lvbmFsbHkgaW1wb3J0ZWQgY29kZSBkYXRhIGludG8gbGlzdCB2YXJpYWJsZXMK
b3IgZXZlbiBkYXRhYmFzZSB0YWJsZXMuCgoKPiBJJ2xsIHRyeSB0byBwYXJzZSB0aGUgZHJpdmVy
cy9vZi9iYXNlLmMgZmlsZSBiYXNlZCBvbiBjb21tZW50cyBsaWtlIHRoaXMKPiAiKiBSZXR1cm5z
IGEgbm9kZSBwb2ludGVyIHdpdGggcmVmY291bnQgaW5jcmVtZW50ZWQsIHVzZQo+ICogb2Zfbm9k
ZV9wdXQoKSBvbiBpdCB3aGVuIGRvbmUuIgo+IHRvIGF1dG9tYXRpY2FsbHkgZ2V0IHRoZSBuYW1l
IG9mIHRoZSBmdW5jdGlvbiB0aGF0IG5lZWRzIHRvIGJlIGNoZWNrZWQuCgpXaWxsIGZlYXR1cmUg
cmVxdWVzdHMgbGlrZSB0aGUgZm9sbG93aW5nIGJlY29tZSBtb3JlIGludGVyZXN0aW5nPwoKKiBB
ZHZhbmNlZCBkYXRhIHByb2Nlc3NpbmcgZm9yIHNvdXJjZSBjb2RlIGNvbW1lbnRzCiAgaHR0cHM6
Ly9naXRodWIuY29tL2NvY2NpbmVsbGUvY29jY2luZWxsZS9pc3N1ZXMvNTcKCiogQWRkIGEgbWV0
YXZhcmlhYmxlIGZvciB0aGUgaGFuZGxpbmcgb2Ygc291cmNlIGNvZGUKICBodHRwczovL2dpdGh1
Yi5jb20vY29jY2luZWxsZS9jb2NjaW5lbGxlL2lzc3Vlcy8xNDAKCgo+IFdlIHdpbGwgY29udGlu
dWUgdG8gYW5hbHl6ZSB0aGUgY29kZSBvZiBjb2NjaW5lbGxlCgpIb3cgd2lsbCB0aGUgdW5kZXJz
dGFuZGluZyBldm9sdmUgZm9yIHRoZSBPQ2FtbCBzb3VyY2UgY29kZQpvZiB0aGlzIHNvZnR3YXJl
PwoKCj4gdG8gY29uZmlybSB3aGV0aGVyIHRoaXMgZmFsc2UgcG9zaXRpdmUgaXMgYSBidWcgaW4g
Y29jY2luZWxsZS4KCkkgYW0gYWxzbyBjdXJpb3VzIG9uIGhvdyB0aGUgY29ycmVzcG9uZGluZyBj
bGFyaWZpY2F0aW9uIHdpbGwgYmUgY29udGludWVkLgoKQnkgdGhlIHdheToKWWVzdGVyZGF5IEkg
c3R1bWJsZWQgb24gYW5vdGhlciBxdWVzdGlvbmFibGUgc29mdHdhcmUgYmVoYXZpb3VyCndoaWxl
IHRyeWluZyB0byBhcHBseSBhbiB1cGRhdGUgc3VnZ2VzdGlvbiBmcm9tIG91ciBkZXZlbG9wbWVu
dCBkaXNjdXNzaW9uCm9uIHRoZSB0b3BpYyDigJxbdjZdIGNvY2NpbmVsbGU6IHNlbWFudGljIGNv
ZGUgc2VhcmNoIGZvciBtaXNzaW5nIHB1dF9kZXZpY2UoKeKAnS4KaHR0cHM6Ly9sb3JlLmtlcm5l
bC5vcmcvY29jY2kvMjAxOTAyMTkxMDE0MTU2NjgwMjk5QHp0ZS5jb20uY24vCmh0dHBzOi8vc3lz
dGVtZS5saXA2LmZyL3BpcGVybWFpbC9jb2NjaS8yMDE5LUZlYnJ1YXJ5LzAwNTYyMC5odG1sCgoK
PiBCdXQgdGhpcyBzdGF0ZW1lbnQgaXMgY3VycmVudGx5IG5lZWRlZCBoZXJlLgoKV2lsbCB0aGUg
bmVlZCBiZSByZWNvbnNpZGVyZWQ/CgoKSSBnb3QgYW5vdGhlciBkZXZlbG9wbWVudCBjb25jZXJu
IGhlcmU6CllvdSBwcm9wb3NlIHRvIHVzZSBhIFNtUEwgY29uanVuY3Rpb24gaW4gdGhlIHJ1bGUg
4oCccjHigJ0uCkhvdyBkb2VzIGl0IGZpdCB0byB0aGUgcHJldmlvdXMgZXhjbHVzaW9uIHNwZWNp
ZmljYXRpb24g4oCcd2hlbiAhPSBvZl9ub2RlX3B1dCh4KeKAnT8KClJlZ2FyZHMsCk1hcmt1cwpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpDb2NjaSBtYWls
aW5nIGxpc3QKQ29jY2lAc3lzdGVtZS5saXA2LmZyCmh0dHBzOi8vc3lzdGVtZS5saXA2LmZyL21h
aWxtYW4vbGlzdGluZm8vY29jY2kK
