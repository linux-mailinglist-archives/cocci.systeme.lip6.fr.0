Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A1DF5582CD
	for <lists+cocci@lfdr.de>; Thu, 27 Jun 2019 14:45:57 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x5RCjIfe026923;
	Thu, 27 Jun 2019 14:45:18 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 8CE407785;
	Thu, 27 Jun 2019 14:45:18 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 8B9E37772
 for <cocci@systeme.lip6.fr>; Thu, 27 Jun 2019 14:45:17 +0200 (CEST)
Received: from mout.web.de (mout.web.de [217.72.192.78])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x5RCjGNw005500;
 Thu, 27 Jun 2019 14:45:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1561639516;
 bh=Nt4Ja8KFsUpb45hN4W8AsthiIgkInOt6K6yCMgue/Ms=;
 h=X-UI-Sender-Class:Subject:To:References:Cc:From:Date:In-Reply-To;
 b=rr6nS5Gbaor2DNZzm6Vk2m0fhJ2kZ6rEd8SJMBZSxyg/Cl38LYHtd3IlfoqUtSw6s
 eRAJd5lAGVxOcL6pYSoCBiJHOhRMVTQNLXYKqpuzdaozq5DYNB8zglZOwmMPu3HrfQ
 aWP5SD/IFssWx6zM+5K2ndj5F5TjY9XOBIMxQHdQ=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([78.48.74.178]) by smtp.web.de (mrweb103
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0LmLgE-1iG5VZ41ly-00Ztac; Thu, 27
 Jun 2019 14:45:16 +0200
To: Julia Lawall <julia.lawall@lip6.fr>
References: <708207db-69d7-8962-e507-cd705142d0c4@web.de>
 <f79ae892-a674-5f69-1d25-88594a89ebff@web.de>
 <alpine.DEB.2.21.1906271332240.2627@hadrien>
 <f84bb58a-916b-0d6b-64fd-7805bd8db827@web.de>
 <alpine.DEB.2.21.1906271427250.2627@hadrien>
From: Markus Elfring <Markus.Elfring@web.de>
Openpgp: preference=signencrypt
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <28402af4-cf74-7309-56c0-f1703c71b3a9@web.de>
Date: Thu, 27 Jun 2019 14:45:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.1906271427250.2627@hadrien>
Content-Language: en-US
X-Provags-ID: V03:K1:hYEqKYFcK8zhTczqACaWfM8BbPCQbDftQyp1k40B4dULxkBamhp
 yd7bxEFWt8JbxG2rhqQxCxisIWc4gzHvE4SMYa/A0BnfR0+Jh5Y5lxyzMAyJEXVFBh0ydGx
 bPlMf52dCML6M4lzvwg+tmZncBsYqUsPMM5VdkcNrAbzYdvg1cOzV/4EGOoAuJ1E+8KctZG
 cWKcnOv74oDNv2MwfOTXg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:nFiGzCpcq2U=:u4qNiUk1eeQemqeyZhdNqP
 Z6KKVXuHPkFxpZ5EOKRPBtaIXra0vObmWsxoc4wl1Yh4AFG5HFY4odWCQ3ExVwMRTTyRFsFH3
 nyIjg9mLLcHm8d+O/YzMLiTrRQBAPTQh50UnCjYVQSgsva/0zCUqUvRCUjopgknmPMhXwjLua
 mYwCAdOqPhCB5d0f9mw9/yo8wAwlv4dSbb0ryvbbT8a9+Ykhj5s19INavpKldzfeWlrnAKpaw
 O+7VUlirm8wH3Tad3ugWF5F8IjwFfCYzFwxSNRvYs9BpNerldE5Zv5kBPyyrL39JZnKJt1XwZ
 UWE+7UGRuJWPhCcGS0obwZVy4Mxym/Z+Cr/fHJMdbfWxLkCsWYwWd8094j/9XU3DS8O+v57Xo
 9FzcvFglM0V5HIpROc9J15FQzUQ2Pi+0kwtD/pVLckRoN228wW3ZlubBkjJuSTtHineTBaML4
 JwWbah41XxYqKdTB/5fvC4Jr4YE1ICZMrxSTXJPRPwyQjDYTGytofVeKffgGloFQovzIIgt4q
 V6q9nMlc46c8M+mtmpHP7WLRMdBxws/4nUL8h0eosj7/zwqek5p9agu7rj8KqQ5KYwiYKrMRk
 kI5UoPtjjfNOqIf6HRbaNPof4kHq4WN06rGpjLRdCPmNwcHzabZz+JeaK7IXCdUvfVvErYr3u
 3SEG077h3OQZIq59AdT2WS/bjuMCSLQgn2ApUKhJchOscgwG9H7ZpvLSm+dx0CM6/COPXajDZ
 N8wo1dxZtp89JwTLuWTobCMhe+VLUlqbG3rk1qJop0HiwvGcnr/0JE8phS6tUNsIEVEu0BwqS
 VWKODj18GAFXKFr29l/oEEhF8ya891yPfhTaypuE4MVqzkNnzS50v85BPp9erIganxQrF0/vJ
 AZSAOfDW/07zDe0ZAm7oYKz8u89pUTHFQWlV9QrPgKGFeWn2hul7pkONH1Jps1DN5mP95+j5t
 eiKos3e1X+eLCGIc5WUkTvTbJZUVEdKQsaPQ2K7VLK6g0P2OVg9jzsseRjpezv2uZ5IwM+7Ad
 gwMlDko5oGyRdAK+sLN7x/hIOg9XF5YTmKlMR58kIGNRRNXGgzHpltOhluFSMfGu+XLKbR+XV
 XxVq91o4vjkNMeSVqhVy4jiRSAH3qX78ZE3
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Thu, 27 Jun 2019 14:45:20 +0200 (CEST)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Thu, 27 Jun 2019 14:45:17 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: Coccinelle <cocci@systeme.lip6.fr>
Subject: Re: [Cocci] Moving exception handling code to the end of a function
 implementation with SmPL?
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

Pj4+IFlvdSBjYW4gdHJ5IHdpdGggdGhlIG9wdGlvbiAtLWRlYnVnLgo+Pj4gT3IgaWYgdGhhdCBk
b2Vzbid0IGhlbHAgd2l0aCB0aGUgb3B0aW9uIC0tdmVyYm9zZS1jdGwtZW5naW5lLgo+Pgo+PiBI
b3cgY2FuIHRoZXNlIHBhcmFtZXRlcnMgaGVscCB0byBjbGFyaWZ5IHVuZGVzaXJhYmxlIHJ1biB0
aW1lIGNoYXJhY3RlcmlzdGljcz8KPgo+IEhvdyBhYm91dCBhY3R1YWxseSBsb29raW5nIGF0IHRo
ZSByZXN1bHRzIHlvdXJzZWxmPwoKSSBkaWQgdGhhdC4gLSBJIGRvIG5vdCBmaW5kIHRoZXNlIGV4
dHJhIGRhdGEgc28gaGVscGZ1bCBhdCB0aGUgbW9tZW50LgoKVGhlIGluZmx1ZW5jZSBvZiBwcmVz
ZW50ZWQgYmFja2dyb3VuZCBpbmZvcm1hdGlvbiBvbiBzb2Z0d2FyZSBleGVjdXRpb24gc3BlZWQK
aXMgc3RpbGwgdW5jbGVhci4KCgo+PiByZXBsYWNlbWVudDogYWxyZWFkeSB0YWdnZWQgdG9rZW46
Cj4KPiBZb3UgdHJ5IHRvIGFkZCB0d28gdGhpbmdzIG9uZSBvbmUgdG9rZW4sIHdoaWNoIGlzIG5v
dCBhbGxvd2VkLgoKQXJlIHRoZXJlIGFueSBvdGhlciBzb2Z0d2FyZSBkZXZlbG9wbWVudCBjaGFs
bGVuZ2VzIHRvIGNvbnNpZGVyCmZvciB0aGUgaW5zZXJ0aW9uIG9mIGEgYml0IG9mIHNvdXJjZSBj
b2RlIGF0IGEgZnVuY3Rpb24gaW1wbGVtZW50YXRpb24gZW5kPwoK4oCmCm91dF9rZnJlZV9pb2M6
CglrZnJlZShpb2MpOwoJcmV0dXJuIGVycm9yOwp9CuKApgoKUmVnYXJkcywKTWFya3VzCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkNvY2NpIG1haWxpbmcg
bGlzdApDb2NjaUBzeXN0ZW1lLmxpcDYuZnIKaHR0cHM6Ly9zeXN0ZW1lLmxpcDYuZnIvbWFpbG1h
bi9saXN0aW5mby9jb2NjaQo=
