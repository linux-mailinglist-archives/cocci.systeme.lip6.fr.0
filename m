Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AFD71B76BB
	for <lists+cocci@lfdr.de>; Fri, 24 Apr 2020 15:16:24 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 03ODFxqg026091;
	Fri, 24 Apr 2020 15:15:59 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id E8F84782E;
	Fri, 24 Apr 2020 15:15:58 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id A757A7815
 for <cocci@systeme.lip6.fr>; Fri, 24 Apr 2020 15:15:56 +0200 (CEST)
Received: from mout.web.de (mout.web.de [212.227.17.12])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 03ODFs9X027168
 (version=TLSv1.2 cipher=DHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO)
 for <cocci@systeme.lip6.fr>; Fri, 24 Apr 2020 15:15:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1587734153;
 bh=b/A2wTrl3s/e6rD0rGtHMXVCwh3A4MP5nFyej2wpOWE=;
 h=X-UI-Sender-Class:Cc:Subject:To:From:Date;
 b=BuDOyX9TCtK7F3bBZGVG0uknyxSIhdcrwqeGxQ2AcnDNLbG5KZOC0NbGBArRoIYJI
 AtEHSVE40qFoODhmMgawTQZ1ZG0PrsUx5G0zymEApKlQaAcW4/c1vq5VdE7J6YZgjd
 /mpc5HXEq/7UbcbHk54mH+0GXtYlW/d2HGc7EP6I=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([78.48.129.82]) by smtp.web.de (mrweb102
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0MgO8g-1joScR1JTC-00NmNW; Fri, 24
 Apr 2020 15:15:53 +0200
To: Jaskaran Singh <jaskaransingh7654321@gmail.com>
From: Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <e9ae714e-a293-ebfd-1806-0a8220e8ab0a@web.de>
Date: Fri, 24 Apr 2020 15:15:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
Content-Language: en-US
X-Provags-ID: V03:K1:0Zm7T4rZG/V7ADslwZR+WKqOwoQM8kjQ4qNhKLXFAx1OrBcwGN6
 18aJAmqznvz38L2EwH9+mkYCOajJ/rRwmtPRpzyho82eFQV1HuGQZsEpUNVOGFvEgJuIEti
 ZHw3UsG8jrB+jJzL/Y5f+uXj5eqsV4+HFsZNivn5T0VnTtc1Xj9rnQKwsDxnmVuYpE26u+k
 B/JQbkXbHQ8lJYTuJlQiA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:nOO5Nqg/j1w=:I296LsqACrqYpRdr2FzsWS
 nKCKrjvRD/jIkaTge8mIN5rhIeNEOUjYOYx18mwzfdcmGEgI9fgUqIleFaAztotmb2LDl4wtK
 TJ0CHgQ4GsqrNPpnhYXpjSk9AFGY9A+12ILf0JZPvjDei9a1emmtCqGU59Nafb4gU/u1UQJB7
 3xx2gh2zo9vuDrxk2AYjuqK4tF4q2mJH5nYY9FFkZQcvR8SnWR9lU5gKwyDRkl513DIkXo58W
 cSNgdx9oHbqsU0cv9Di3t1Sd6IH5gsrU1aXXqTJ/BsYSxktExPYM/0KXvlwWU8D0mHSzKPOHY
 w1rwDADZsX12CsXDcA2ouW+Eq50l0k8KxklbZdYZUMcuVTxGV8B5s22M5h8rcNUrr/YZQ6i1t
 u3WegnDlUFS8hsJQDeJ8dl4GMjDqHujxvvtRNq5druSXGKYi7dYdsv0pBRroLe6InxzQF1UL+
 kyj05ZWwHlrdDLmwb1idTxcz/N3vVwNI+WjMNbpoecKIDwsRdw33RA0JamkkL17CVCw5AyyNw
 NGIAuz2ZNcJL58hyuC9mWEavHqBp5LKJ3f/ZXp1BbndSwzf0rjScdL7oLjF5JdUUIDMUs/7+N
 a5Rz+4jw6BSoqDkWLRwLbYRPHK0laBLyvlCo8y9v6Ngef9Xkm8Dg+MHlDnVyXxvQOMnBEaWnA
 9vGx7k3ogERf6l9GFhgoP442etposfmwvyTovIb1H7yJb/MqfDOh95bTBq57lNA93VjMUclPw
 cEvlBAapgDVNV0PRSmfZ1ks9EoBLZBuOESWCj0AWk8vj+EhZnNjCMRDusJ4eIveVSed8I9sP3
 m3pwvr4706FrYeNimEHDSBvvZ4A2ANm3RRmNBWzo8FyiI56m47y4/ipG0lpmG4p7f6tiBwiaz
 Nc3zQmQ8iSKuFgiI6MVqGOo5iRZIi4YfSR/2wt5R5O7P3QcryIu0ZC7oVrx3I2fmnH6rCg2mG
 xuB1nzQ9SdmYRRDJg6wjXAIleb5RpCgXf+0Iq4dRlZzXw+VisXSjtez5I7Ud8fAbI29Vw9gdj
 4TxgB8VLWOEtxP/cwiD9GJacJQwkhVmF+Nj5KoyqSQ9/J01wRn8qy6X0kq3p/6ueGJNf0FQWH
 b6WjVI8e6AbIdoQGrcYxxPH+771LRH4enoLWzheWTC9CuLZQApJgfCr8vdN/IS70oqCTXqH4b
 zLA9b6GAz9KCCcry+cqUHrdX+HQNG5WoDzew+6uMdZxLbBUwjjuMD/S2b5bQpEs18SSGmQEhS
 07VPz89mz28I4X9Zn
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Fri, 24 Apr 2020 15:16:00 +0200 (CEST)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Fri, 24 Apr 2020 15:15:54 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: linux-kernel-mentees@lists.linuxfoundation.org, cocci@systeme.lip6.fr
Subject: Re: [Cocci] [RFC PATCH 17/25] engine: cocci_vs_c: Add allminus
 argument to attribute_list
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

PiBUaGlzIGFsc28gbWFrZXMgc3VyZSB0aGF0IHRoZSB0ZXN0IGNhc2UgdW5zdHJ1Y3QgZG9lcyBu
b3QgYnJlYWsgd2hlbgo+IGF0dHJpYnV0ZXMgYXJlIGlkZW50aWZpZWQgY29ycmVjdGx5IGJ5IHRo
ZSBDIHBhcnNlci4KCldvdWxkIHRoZSB3b3JkaW5nIOKAnGFyZSBjb3JyZWN0bHkgaWRlbnRpZmll
ZOKAnSBiZSBtb3JlIGFwcHJvcHJpYXRlPwoKUmVnYXJkcywKTWFya3VzCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkNvY2NpIG1haWxpbmcgbGlzdApDb2Nj
aUBzeXN0ZW1lLmxpcDYuZnIKaHR0cHM6Ly9zeXN0ZW1lLmxpcDYuZnIvbWFpbG1hbi9saXN0aW5m
by9jb2NjaQo=
