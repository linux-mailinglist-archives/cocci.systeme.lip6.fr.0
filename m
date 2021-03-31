Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FA9B34BBD3
	for <lists+cocci@lfdr.de>; Sun, 28 Mar 2021 11:29:36 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 12S9TNxb007977;
	Sun, 28 Mar 2021 11:29:23 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 222B277E6;
	Sun, 28 Mar 2021 11:29:23 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 2CAA73E8A
 for <cocci@systeme.lip6.fr>; Sun, 28 Mar 2021 11:29:22 +0200 (CEST)
Received: from mail2-relais-roc.national.inria.fr
 (mail2-relais-roc.national.inria.fr [192.134.164.83])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 12S9TLFi008507
 for <cocci@systeme.lip6.fr>; Sun, 28 Mar 2021 11:29:21 +0200 (CEST)
IronPort-HdrOrdr: =?us-ascii?q?A9a23=3AqBkM5Ko2pPL6EwsMlZDxwCgaV5rdeYIsi2QD?=
 =?us-ascii?q?101hICF9WMqeisyogbAnxQb54QxhOk0ItNicNMC7MBfh3LFv5415B9afdS3HnE?=
 =?us-ascii?q?ftE41494vlxFTbak7D38pQz71pfaQ7KNCYNykese/A7AO1E8ktzbC8mcjC79v2?=
 =?us-ascii?q?9Ht1SBEvVqcI1WdEIzyGGU57ThQuP/YEPaebj/ArmxOQPVAebsG2HRA+MdTrlp?=
 =?us-ascii?q?nztaujRwUHCR4h4BSPij3t0rTgEwGEty1wbw9y?=
X-IronPort-AV: E=Sophos;i="5.81,285,1610406000"; d="scan'208";a="500347911"
Received: from 173.121.68.85.rev.sfr.net (HELO hadrien) ([85.68.121.173])
 by mail2-relais-roc.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 28 Mar 2021 11:29:21 +0200
Date: Sun, 28 Mar 2021 11:29:21 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <0756b630-a2d7-f300-3b11-59af33b48631@web.de>
Message-ID: <alpine.DEB.2.22.394.2103281128560.2854@hadrien>
References: <0756b630-a2d7-f300-3b11-59af33b48631@web.de>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Sun, 28 Mar 2021 11:29:23 +0200 (CEST)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Sun, 28 Mar 2021 11:29:21 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: Coccinelle <cocci@systeme.lip6.fr>
Subject: Re: [Cocci] Replacing #define directives with the help of SmPL
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



On Sun, 28 Mar 2021, Markus Elfring wrote:

> Hello,
>
> Will the software development interests ever evolve in ways so that #define directives
> can be replaced with the help of the semantic patch language for special source code
> analysis and transformation approaches?
> https://github.com/coccinelle/coccinelle/issues/139

I looked at the link, but there is no concrete example of something that
does not work, so I have no idea what the problem is.

julia
_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
