Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4324F1C615E
	for <lists+cocci@lfdr.de>; Tue,  5 May 2020 21:51:38 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 045Jp2br016930;
	Tue, 5 May 2020 21:51:02 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 7B1A1782D;
	Tue,  5 May 2020 21:51:02 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 2AC543E6B
 for <cocci@systeme.lip6.fr>; Tue,  5 May 2020 21:51:00 +0200 (CEST)
Received: from mail.socioholic.net (mail.socioholic.net
 [IPv6:2a01:4f8:172:3845:0:0:8ac9:d2d4])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 045JoxqL024091
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <cocci@systeme.lip6.fr>; Tue, 5 May 2020 21:50:59 +0200 (CEST)
Received: from [IPv6:2003:db:172e:4500:f654:9ca9:f1f3:7ab0]
 (p200300DB172E4500F6549CA9F1F37AB0.dip0.t-ipconnect.de
 [IPv6:2003:db:172e:4500:f654:9ca9:f1f3:7ab0])
 (Authenticated sender: kaspar)
 by mail.socioholic.net (Postfix) with ESMTPSA id 40A68106331;
 Tue,  5 May 2020 21:52:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=schleiser.de; s=mail;
 t=1588708326; bh=CHYLPqGRXpsj0agyN+32FJmvkrKi1QdSD5/MWFGZOjM=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=Zj/vGa5cs/u3v1lcnXMHDNZc621tqj9wv75B1dQs2F6v559qTPG6L8zxxDTdBrSwT
 w+NhfsSpFsxajWSsAeNlSaoRHTmViqnpj00195sQ64AfqO8KGwf1xPJW8PjquUypUa
 YS4ft0onx/G8i1wt7zYhoZJmafaXQGZ1adlYDy6xbrAV0BSi8GjzXlxPziWW3LGIgV
 xtadKo0djtn1rTDJhFRUZ+evimdGV6iTZOH+Kg5XdGq/q9GaYT0ECoXbdjXI4WdpCJ
 Ts9+Jd7t4MvzFT3LCVZRMWXp4lMIaIlxz4Cg23ysafbGpkVCjHmn75R02BvQ5qPlW1
 TRkJbwOoMOgZQ==
To: Julia Lawall <julia.lawall@inria.fr>,
        Nicolas Palix <nicolas.palix@univ-grenoble-alpes.fr>
References: <alpine.DEB.2.21.1909302142430.2925@hadrien>
 <eccc921f-c5f5-6dc5-5233-75f0fc16cb51@schleiser.de>
 <904fcac6-77cb-b44b-07fd-430bf3596614@univ-grenoble-alpes.fr>
 <ed125ed8-a2f8-2c1a-b0aa-acf83544cae8@schleiser.de>
 <fe7da089-446f-1d37-3d37-b24cdeff2a9f@univ-grenoble-alpes.fr>
 <alpine.DEB.2.21.2005051522410.2462@hadrien>
From: Kaspar Schleiser <kaspar@schleiser.de>
Autocrypt: addr=kaspar@schleiser.de; prefer-encrypt=mutual; keydata=
 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
Message-ID: <1f2a8999-c68c-485b-3690-35a4a6654aae@schleiser.de>
Date: Tue, 5 May 2020 21:50:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2005051522410.2462@hadrien>
Content-Language: en-US-large
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Tue, 05 May 2020 21:51:03 +0200 (CEST)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [IPv6:2001:660:3302:283c:0:0:0:2]);
 Tue, 05 May 2020 21:50:59 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78
Cc: cocci@systeme.lip6.fr
Subject: Re: [Cocci] 1.0.8 on Ubuntu
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

Hi,

On 5/5/20 3:23 PM, Julia Lawall wrote:
>> Julia, maybe it worth recording the sequence of commands somewhere,
>> in the README or the website.
> 
> Good idea.  I'm just concerned about the word "roughly".  Kaspar are there
> any details that need to be added?
> 
>>>
>>> The commands were roughly:
>>>

I went through the commands again, this time with the package files
proposed by Nicolas, from [1].

I'm starting a fresh focal container using:

$ docker run --rm -ti ubuntu:focal /bin/bash

Then, in the container prompt:

$ cd
$ apt install devscripts equivs wget
$ wget
https://launchpad.net/ubuntu/+archive/primary/+sourcefiles/coccinelle/1.0.8.deb-2/coccinelle_1.0.8.deb-2.dsc
$ wget
https://launchpad.net/ubuntu/+archive/primary/+sourcefiles/coccinelle/1.0.8.deb-2/coccinelle_1.0.8.deb.orig.tar.gz
$ wget
https://launchpad.net/ubuntu/+archive/primary/+sourcefiles/coccinelle/1.0.8.deb-2/coccinelle_1.0.8.deb-2.debian.tar.xz
$ dpkg-source -x coccinelle_1.0.8.deb-2.dsc
$ cd coccinelle-1.0.8.deb
$ dpkg-buildpackage -rfakeroot -b

There's now a package file at "/root/coccinelle_1.0.8.deb-2_amd64.deb".
Whith the container still running, it can be copied out, from another shell:

$ docker cp 1de810777b2a:/root/coccinelle_1.0.8.deb-2_amd64.deb .

(replace 1de810777b2a with the contianer id, find out by looking at the
container's prompt ("root@<id>:...$") or using "docker ps".)

This deb can now be installed via:

$ apt install ./coccinelle_1.0.8.deb-2_amd64.deb

Kaspar

[1] https://launchpad.net/ubuntu/+source/coccinelle/1.0.8.deb-2
_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
