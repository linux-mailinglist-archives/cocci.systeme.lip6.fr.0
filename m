Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 333FC17E054
	for <lists+cocci@lfdr.de>; Mon,  9 Mar 2020 13:33:40 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 029CXEBs022412;
	Mon, 9 Mar 2020 13:33:14 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 989337818;
	Mon,  9 Mar 2020 13:33:14 +0100 (CET)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id C13EE77F4
 for <cocci@systeme.lip6.fr>; Mon,  9 Mar 2020 13:33:12 +0100 (CET)
Received: from mout.web.de (mout.web.de [212.227.15.4])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 029CXCQW008899
 (version=TLSv1.2 cipher=DHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO)
 for <cocci@systeme.lip6.fr>; Mon, 9 Mar 2020 13:33:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1583757191;
 bh=YmsEzSGBGQN4JIe7XApMpXoPscrCFFRJFEEm1FD+TNc=;
 h=X-UI-Sender-Class:Cc:Subject:To:From:Date;
 b=fCxDedLE6SgN/zs9NZ6iWAzJB22AEgg7DNNnsSHJ3ArOWRMAOdxsudRbRtXB9rmFN
 bncqETcq2540YHRFzRp3178+TwQ2hHKWaZ/PdB3u3GalDdlsDJNuDo9kQEiW3KJSGl
 P4EaMSuOmYrlH4j8VJ7wN6VkM23F3yJVdPFWafxc=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([93.135.147.116]) by smtp.web.de (mrweb004
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0LbOuI-1jdRLo3nfG-00kwOc; Mon, 09
 Mar 2020 13:33:11 +0100
To: Jaskaran Singh <jaskaransingh7654321@gmail.com>, cocci@systeme.lip6.fr
From: Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <68d10394-63c9-0504-a258-bbd65035a751@web.de>
Date: Mon, 9 Mar 2020 13:33:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
Content-Language: en-US
X-Provags-ID: V03:K1:FG77M/f1f8TPNYkMBeYIyzSZKmcA/vvKH/vmIwEd3yG648VMoZq
 ZfREmO5JVgZzHiiS73tG0sKi2DFlJpMXA0yuj8C5rd+DBw+rWGL/7KjlFRIVIsxDjVOGtdj
 DKHOvV6zDs4goSlMMT4ITrDoGEcH/YUGlkcK7ggYWdB4ruxvG2PDhrS+YiMC+uaGB7Ks0b/
 mdKXEYSb+xEqRcHzoh69A==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:XdeIBxIMLYI=:BqVm0IdIdEKsp+vw9UvHEG
 ShaHw9UaB9isY2btLOgiVOGD8HHIL719dPn+Cp58d4/qhJTdJS/5LyE9UxlyUVHspigVtkaA4
 sYBf+mIeLh+si817v3Rj6wNDkNjriT3pCSBM0zlBZqcaU7zolly3flNwZPPtRkW5xcVIOwaZu
 JQFWl/Kd0k4u+O7KvXqJzyyKVYb3BlXwJgvqdrYqCIqYspp5JEMlwc4KyfTNxvOSHFCanh2FB
 lTlNqRabfbvDkGJOYB73BapIh2pY6OURAvId3U5x6FAFgImAE/ENRuEUiDVKWiS+Vx0VZGQx9
 BmUpalZtC7kqZcHm5ZzLmcs8E3X1DjA9qBVez1U2ZR+IyupWed1VdsmFjYX9V1J9N7gp29eKI
 EGA6+6RJ+doO4axAq/me5Xehpd2NijElfZk2JSK6XJcVUhsar6d5NcwAq3t2CuNv50hwCLr2j
 dkutUP5YXiGdR/SG0ISdL5hnixOP+AYYtYsFYXNyUo2nkS7lICiGKFZub7K+RA0YQSNRZscW1
 ysmbH2HoQd+JIXJVS5ilT6ku8OT223m0poSbWyeyQvdr2qBGhWhTt4PzX7oDeU8MYAXNuHJ8p
 VWCii5Awr1ppBEBxprMV2n7WYYh/9CRJq6+l0NckZqY9VN0v5+3QlsQrko1XblQKqdqoI1Kyy
 x9GLP3m27rLgvi3MldmrgMm5SJvMRrttHBgK7C997GEmkwgccMSCDxhhtFm8hBIeVWqoqGpfH
 vVlTvw38GDaFAJ0tuxz3/mkmkYtjiajZVMAQBhBJMQHt9RuS7ZZ8O038h505qKNwWWs/5nOeE
 ixxqfo4ICLRLTZWNNYfZRDYRZzI7rxTkN7+E/9LHRYAr2ZpYpCsPtuDR+PC1e2GDC4Bp2VdRj
 rUteMA+1DOX1gKOvfyWhzRC1E/EfSn2YF7h5acSPGV5zYhGtPH0/0KaWzAgdbp2PeK6zJtXRJ
 qanvsPPYYvp/nwHjH+kfQiA4cTjelB0UUG1iO3c5IBsEKHqQKDL+MVdLPMYFepjiJzcjqPmts
 xQD9pwdbtQ7SqByKYLtMhCd28BdNv9cw0IQ0T5BBzkqN5DGSO4Uh3p/l5d7XfuXNZmAsDLksl
 gTQZlZiKLE95L0b/g5FOCmFTBOi5FrmIu74uf6QmdNA9SJvyFP9ODGk/T50qRaLZ5itVXjyz1
 0Ts4nKICUgfJDJrw5mdErI4dECAj/v8CWrOipIYtjSgnvPk5KLYHWOKhT9OkJxO4d4kr2RThk
 c2iJy/FR6L1M93kSw
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Mon, 09 Mar 2020 13:33:14 +0100 (CET)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Mon, 09 Mar 2020 13:33:12 +0100 (CET)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Cocci] [PATCH 07/13] parsing_cocci: Reflect visitor_ast0
 changes in parsing_cocci
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: cocci-bounces@systeme.lip6.fr
Errors-To: cocci-bounces@systeme.lip6.fr

> The SmPL AST0 visitor has functions for handling enumerators
> separately. Handle these collateral evolutions in parsing_cocci

I got the impression that an other change description would be easier to understand.

Regards,
Markus
_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
