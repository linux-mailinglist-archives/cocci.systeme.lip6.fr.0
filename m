Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 602B81A636E
	for <lists+cocci@lfdr.de>; Mon, 13 Apr 2020 09:11:40 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 03D7B6bF021881;
	Mon, 13 Apr 2020 09:11:06 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id CB2F4782F;
	Mon, 13 Apr 2020 09:11:06 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 74C177750
 for <cocci@systeme.lip6.fr>; Mon, 13 Apr 2020 09:11:04 +0200 (CEST)
Received: from mout.web.de (mout.web.de [212.227.17.11])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 03D7B3fs001825
 (version=TLSv1.2 cipher=DHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO)
 for <cocci@systeme.lip6.fr>; Mon, 13 Apr 2020 09:11:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1586761862;
 bh=hS1Xzb/x+0xHjye+SzS2NpGyfakxJ9aFG7nF/Csw6KE=;
 h=X-UI-Sender-Class:Subject:From:To:Cc:References:Date:In-Reply-To;
 b=ofKxf1v/oXG/VLDl/6j2dHZRhwrRThY9MHFYwUowVftFI7ER07Kz7Aj7CKe3LGOUK
 FK7hLUkV3XY+S9pS6yEvVIdUQEJWFWkv8XjHsviAawgFMdsRhsG+YE3z5+LpWIgjfu
 8yZdHGZZ4uc47xSHDjSvxkdtCbOpxK6Q/uds/c98=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.3] ([93.133.146.177]) by smtp.web.de (mrweb103
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0Lheqz-1itWS70CUz-00muY6; Mon, 13
 Apr 2020 09:11:02 +0200
From: Markus Elfring <Markus.Elfring@web.de>
To: Julia Lawall <julia.lawall@inria.fr>
References: <146360ce-9cfb-e6f5-1601-fa95460c2cd5@web.de>
 <alpine.DEB.2.21.2004101712080.3039@hadrien>
 <f0b37f45-5144-a1c5-3f52-5bfbb6f3635f@web.de>
 <alpine.DEB.2.21.2004111600560.2369@hadrien>
 <fcbca1d9-7375-b488-54b2-a3934b90c6ed@web.de>
 <alpine.DEB.2.21.2004112036270.2369@hadrien>
 <d878a25d-29fd-28b1-fa6f-2e0f44763d73@web.de>
 <alpine.DEB.2.21.2004121050210.2419@hadrien>
 <ab6d402e-3c12-25ab-162a-f200c382dd0a@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <d68533a4-554a-fd38-a940-1c3fb15c4dae@web.de>
Date: Mon, 13 Apr 2020 09:10:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <ab6d402e-3c12-25ab-162a-f200c382dd0a@web.de>
Content-Language: en-US
X-Provags-ID: V03:K1:xl0Yo5WoPGvibM/bw8KKPODXgCuDcDDhwqhAD8N34IOzlAw9+6U
 mrC5P8GDt3Ub/nm3gI4qz/SUGo9dKpHfwLUX6KufkEKdfDrR0BjyXFQ1Th3z3DkGT2Ok3qs
 ux9D0It1y8EqaaEW8P8HgDN3Ko7bpiHVBMApyu/7ZS4dpWg15TdxOW1SniyTQ/LgGPWIK0u
 AYjO4LLtUZFm/VaWFL8iA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Mai9V9JPFao=:RsasO2hKQdUxgIgseyrA/i
 JHPA/CFLUUZx00wvksAQPEBL8+bmkEw/gW/Qa+ppVeNH9E4NK1V1ep1rtNZKPfCDFt6Laa4X+
 Bi9xgUWhH28MgHV1g6UB9mpGn+Hk1XrJLuIFob0i4IIhCzGfStm5MVFNMzoLkjKYJmNLnx6L/
 ETuhQEuCfPtYp9MqRmDOL4NVVTSsG1L8CfRK5tWQybfPRXoUrOLeeztC4qCrsUYXn89SdpYMI
 BvJ1fZaS/A5551Dg8uG17c/Xtftge3mNjMsPmLyZMGlaw/T+9XQOTeRUcKnwo6gRyLEintFOl
 wTUNyNNCv0UxtLCy495OpzdNDc1yXZBq/e+D44Iq9eQJMax3N4qIHaXZHo8YDcAsFm5vkjl0n
 Vv73/fmrA9gaaRnkWdNobbPaPGBFN+WtpZF10i2bbDWtO+kkMdKIsZxlWiGrLjU+sjQbzE9px
 w2KSKDp81Z910/UXAgxp3b3rAnzVe9MOogyN1qXwilqVowblpAPXfsSgyNrejvuqKE1pCzNTN
 hE/3UwyJoaJ6HVKiWUecPuVgSfRY2IGegsGS3vx0UdFfwLezseLwzc9WYzQMkBXx5jxSqpDep
 OPMKj7uIrZgTi3Hka0toFXmWDEOSXYU9P//AzgJkYxWgoFZ2wqDECOhKe3jAqG8KF66/BS1ZT
 TYvWwMYlt+L7+BNyGD9YhAxvOIVJQ8pTlhQ9MhDpWkpJSNiYa/f0zfaRYtVgnSc+L2w3ZMAlq
 9RBNg6nrk91tLAL7T6aUhUN34Pu3X1sLzMz00YYHP4qEfCGr7bSiLj+R/nnX/O/Se14sOFcsD
 TwneB8t/wq/j110upbGdOocjV/WVmiupYZlYD9uZIwa/253i4plklHrau6dPNpZqbMHfnUf8/
 0uehOmGA9byileDmophz57wj0tTcI7OFVDsddAcTdoOEa9i0/OBFtweyrBN6ADiPyky7OaTLh
 qeXRn5W7G3zfNJnQfshmVfXh8Vw7P8zi6u/KuMgR+WNP7SEHR6gjWqIXA2tpppnxSWtRtlTo7
 OQ+t83+EWy/Bsx6FNMEHnmzl/OQwDz3sqCckZVPBZ1mSYuXSRAEPHGp3xE0UWUloHG9HbFNJS
 rW2nHvV6g/HaOrf3jedXCtwRDsyvnHu+M0oijzcOt3Ur58+g2E9GRK7qeMByRfNBo1bisYu5c
 sgfK3WPi4K9+RJ0m3C4Yhwk0SOFO0We7X8WQrcDcBeLNYURpgqSbDmweJqu9pu6u6sy123t+D
 w4wRStSuwAteZymEf
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Mon, 13 Apr 2020 09:11:08 +0200 (CEST)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Mon, 13 Apr 2020 09:11:03 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: Coccinelle <cocci@systeme.lip6.fr>
Subject: Re: [Cocci] More support for SmPL data processing with databases?
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

PiBJIGhvcGUgdGhhdCBpdCBjYW4gYmVjb21lIGVhc2llciB0byBjbGFyaWZ5IHdoZXJlIHVuZXhw
ZWN0ZWQgZHVwbGljYXRlIGtleXMKPiB3b3VsZCBvY2N1ciBhcyBpbiBteSB0ZXN0IGFwcHJvYWNo
LgoKVGhlcmUgaXMgdGhlIHBvc3NpYmlsaXR5IHRvIGFwcGx5IGluZm9ybWF0aW9uIGFjY29yZGlu
ZyB0byBhIGNsYXJpZmljYXRpb24KcmVxdWVzdCBvbiBhIHRvcGljIGxpa2Ug4oCcQ2hlY2tpbmcg
dGhlIGhhbmRsaW5nIG9mIHVuaXF1ZSBrZXlzL2luZGV4ZXPigJ0KZnJvbSAyMDE0LTEyLTIwLgpo
dHRwczovL2dyb3Vwcy5nb29nbGUuY29tL2QvbXNnL3NxbGFsY2hlbXkva2xtVXdpaXJJUXcvZzZO
TGlWQUdHQUlKCgoKZWxmcmluZ0BTb25uZTp+L1Byb2pla3RlL0xpbnV4L25leHQtcGF0Y2hlZD4g
c3BhdGNoIH4vUHJvamVrdGUvQ29jY2luZWxsZS9qYW5pdG9yL2xpc3RfY29uZGl0aW9uX2NoZWNr
c19hZnRlcl9mdW5jdGlvbl9jYWxsczJjLmNvY2NpIGRyaXZlcnMvZ3B1L2RybS9tY2RlL21jZGVf
ZHJ2LmMK4oCmClVzaW5nIFNRTEFsY2hlbXkgdmVyc2lvbjoKMS4zLjE1CuKApgolJSBmdW5jdGlv
bjoKbWNkZV9wcm9iZQpsaW5lOgozMjIKJSUgZnVuY3Rpb246Cm1jZGVfcHJvYmUKbGluZToKNDAz
CmFjdGlvbnxjaGVja3wic291cmNlIGZpbGUifGxpbmV8Y29sdW1uCuKApgoKCkhvdyBzaG91bGQg
dGhlIGVycm9yIHJlcG9ydGluZyBiZSBjbGFyaWZpZWQgYXJvdW5kIHN1Y2ggc291cmNlIGNvZGUg
cGxhY2VzPwpodHRwczovL2VsaXhpci5ib290bGluLmNvbS9saW51eC92NS42LjMvc291cmNlL2Ry
aXZlcnMvZ3B1L2RybS9tY2RlL21jZGVfZHJ2LmMjTDMwNwpodHRwczovL2dpdC5rZXJuZWwub3Jn
L3B1Yi9zY20vbGludXgva2VybmVsL2dpdC90b3J2YWxkcy9saW51eC5naXQvdHJlZS9kcml2ZXJz
L2dwdS9kcm0vbWNkZS9tY2RlX2Rydi5jP2lkPThmM2Q5ZjM1NDI4Njc0NWM3NTEzNzRmNWYxZmNh
ZmVlNmIzZjMxMzYjbjMwOAoKCkkgb2JzZXJ2ZSB0aGF0IHRoZSBmb2xsb3dpbmcgU21QTCBjb2Rl
IHZhcmlhbnQgY2FuIHJlc3VsdCBhbHNvIGluCmEgc2lnbmlmaWNhbnQgZGlmZmVyZW5jZS4KCkBm
aW5kQApleHByZXNzaW9uIGFjdGlvbiwgY2hlY2ssIHJlc3VsdDsKcG9zaXRpb24gcDsKc3RhdGVt
ZW50IGlzLCBlczsKQEAKIHJlc3VsdCA9IGFjdGlvbiguLi4pOwogaWYgKAooICAgPCsuLi4gcmVz
dWx0IC4uLis+CiYgICBjaGVja0BwCikgICApCiAgICBpcwogZWxzZQogICAgZXMKCgpIb3cgd2ls
bCB0aGUgYXBwbGljYXRpb24gb2YgU21QTCBjb25qdW5jdGlvbnMgZXZvbHZlIGZ1cnRoZXI/CgpS
ZWdhcmRzLApNYXJrdXMKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KQ29jY2kgbWFpbGluZyBsaXN0CkNvY2NpQHN5c3RlbWUubGlwNi5mcgpodHRwczovL3N5
c3RlbWUubGlwNi5mci9tYWlsbWFuL2xpc3RpbmZvL2NvY2NpCg==
