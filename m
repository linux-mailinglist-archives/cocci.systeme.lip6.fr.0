Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B687722DFBB
	for <lists+cocci@lfdr.de>; Sun, 26 Jul 2020 16:45:28 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 06QEj6VK010983;
	Sun, 26 Jul 2020 16:45:06 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 20E6477B7;
	Sun, 26 Jul 2020 16:45:06 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id B27173F6C
 for <cocci@systeme.lip6.fr>; Sun, 26 Jul 2020 16:30:29 +0200 (CEST)
Received: from mout.web.de (mout.web.de [212.227.15.14])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 06QEUTqs011857
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO)
 for <cocci@systeme.lip6.fr>; Sun, 26 Jul 2020 16:30:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1595773829;
 bh=PTfAGn3oJp9rZj6BbufkDnZOn+zCBXiEviJg6z/okqc=;
 h=X-UI-Sender-Class:Cc:Subject:From:To:Date;
 b=DTh+lZ3nm3YHhKeXmUB/Hh2LFGllSRSTNTnbQc4VQkBbAcsBUJsq5LYLJf95BovoI
 YrSm61PUtuAucCMY62U3+kJ/YjUl8bxHMRwMzZBShfbqbuFKE6umymnb0TWKu85z4P
 oKT+NwBOmy5UwPCbFL3Dr8xqAEZYaSqbbBAJ7yLA=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([78.48.103.185]) by smtp.web.de (mrweb002
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0Lxx4O-1ktki83NmG-015Ewg; Sun, 26
 Jul 2020 16:30:28 +0200
From: Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
To: Jaskaran Singh <jaskaran.singh@collabora.com>
Message-ID: <25fb4894-65d3-dc57-dbfd-93d3482d8fee@web.de>
Date: Sun, 26 Jul 2020 16:30:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Language: en-GB
X-Provags-ID: V03:K1:FxbtM4JhB0CgU1WX4ZlftaPDFkImdfVdQtEq3tVbhNTaO+wZDPL
 CVumcJcbrojXgqSjIp8eiI3fRt5Yec4nVL9924zgRP9FwDII0Kbw6b89J2FQShKH+wzGc7K
 EQalXcf0VifFYyv3/YJcfEaAdvYjqNGN8PRySyMb7wZLqF4ppKGA5r6QVO9Z+LVc7DjZBUM
 bL5KPpHB7YjNkcohU45dw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:tdlWBrBwAK4=:AnNNmZ3g9sGh7kA+54CIiI
 0wdSycVdMG6/9jZMy0wYYcCT7TGkXoV2rfDzOQhpN3+pHAKurCz5pLKA+8dDo0AFwzNG0CcMX
 g38bR5geXixFPErZkM3Y1dmj05AJ0mcwu0uw4zYGfh1YSXa3G6voV8ho7dGXl+movnhIPiZb3
 JmBE7FdCsKAKLcDhcRUjm+TJ72n5Dlgn/krvzu1QgYDv1ulmcad5ipf2W+sU9CeQMbYBPscWg
 qAGZqTcoCLIfTct1D5EBsF9UTo08BoNdS/KnkxjaGzBOgJT81A9oSGDe98Lbj1ZCPBM5wrDIA
 aLIXgAYlJdDQyCWCkth3W2T5SG0TnilJiFWUq9CUzjW91cxgSU4u8j80HpnJTtVYxF/qjmW5e
 emqxJvDSpTeR3RjD4bO8NJLdhzRhuwQRTjDP8OuJeFA8lQManSG7WLJzjV4+Tt0VSdYRPeljP
 3hbl7bs8YuZMgq68GEqOW+FBao1jjXxkAnmYl0gT+XllK7Zjzwsak9Yq1jPPH160fH50ZVK7O
 gFH0dsLT6NZGfb4LVykA48nkrlscXrO/cwf64u/FQD6Waq39Z3+i/xuRB69LxrpNuUNmKHWqE
 bi9xp2sO7LV56K0xuEJ2h0V5El7D1KjX9INmxn5yhnLFCjXicnYGGdLeJNrl3DBoi04mg5gKj
 UlJXViXe5FeD0vVRVbqBk5oepenPgBRJH1ljtftt+l1q/DtG7ojvTJI/YlLajpkUPQrvkFUk9
 kLyjHhxTqtMVdF1K0mU9ax/cTaA3Vi0yKLA4F4TE6pmW1YxmpwUoVyij7jMQsdulCXvNajrKl
 matL38j8YrlIcJ2tK6zN7BFY4nWN76W0hShrlMOVK0f+jYTgy7VFwgNcYk/yBFUxZXeyj43Hj
 IufxqEPq2t1lu+e0VReRSt67GNHASvsLPb0HQBD6jAFYUM6DEEeOpUxJXjA9eM5BGtxOPrVph
 RJsc/PF5mQ85rgcOitQVhXH6r5eZUzqnXcPSisJFCuTStLGdSJYhenTKUzibaweaiZqD7L6g9
 bZJH5BaGVKjtTBdhf7ebKaoXnds+xlNXJpL8MQQ+0OK1fsPPW3BOtY4fg1E1wLMQ70xMMm8DF
 ZB4GsLMwsrsth3pVdxbc8aiPdw1cTFe3n3GJNboD01aDJMS1wDQlqHJuhDlK+JMlVRg2z/VA/
 YunBW1J2fnpPgj4k8d7PJ5yVlX0UmzDf4oW5VU6KF/sLi3TqksOa2It7SiAAlogm3btOLziHY
 sVwy/mj+oIXTHfL8w+UzXy0vH1w+nq+mQVBpSYA==
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Sun, 26 Jul 2020 16:45:06 +0200 (CEST)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Sun, 26 Jul 2020 16:30:29 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Mailman-Approved-At: Sun, 26 Jul 2020 16:45:03 +0200
Cc: cocci@systeme.lip6.fr
Subject: Re: [Cocci] [PATCH 42/43] tests: Add test case to match meta
 attribute
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

4oCmCj4gKysrIGIvdGVzdHMvbWV0YWF0dHIuY29jY2kKPiBAQCAtMCwwICsxLDkgQEAKPiArQEAK
PiArYXR0cmlidXRlIG5hbWUgX19hdHRyX187Cj4gK2F0dHJpYnV0ZSBhOwo+ICtpZGVudGlmaWVy
IGI7Cj4gK0BACj4gKwo+ICstCWludAo+ICsrCWNoYXIKPiArICBiIGEgPSAxOwoKSSBoYXZlIGdv
dCB1bmRlcnN0YW5kaW5nIGRpZmZpY3VsdGllcyBmb3IgdGhpcyB0ZXN0IFNtUEwgc2NyaXB0LgpJ
IGludGVycHJldCBzdWNoIFNtUEwgY29kZSBpbiB0aGUgd2F5IHRoYXQgdGhlIG1ldGF2YXJpYWJs
ZSDigJxfX2F0dHJfX+KAnQppcyBkZWNsYXJlZCB3aGlsZSBpdCBpcyBub3QgdXNlZCBmdXJ0aGVy
LgoKV2lsbCB0aGUgZGlzdGluY3Rpb24gYmV0d2VlbiB0aGUgbWV0YXZhcmlhYmxlIHR5cGVzIOKA
nGF0dHJpYnV0ZeKAnQphbmQg4oCcYXR0cmlidXRlIG5hbWXigJ0gdHJpZ2dlciBhbnkgZXh0ZW5z
aW9ucyBmb3IgdGhlIHNvZnR3YXJlIGRvY3VtZW50YXRpb24/CgpSZWdhcmRzLApNYXJrdXMKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KQ29jY2kgbWFpbGlu
ZyBsaXN0CkNvY2NpQHN5c3RlbWUubGlwNi5mcgpodHRwczovL3N5c3RlbWUubGlwNi5mci9tYWls
bWFuL2xpc3RpbmZvL2NvY2NpCg==
