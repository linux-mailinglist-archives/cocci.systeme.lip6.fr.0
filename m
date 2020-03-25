Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 28958192F4B
	for <lists+cocci@lfdr.de>; Wed, 25 Mar 2020 18:33:09 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 02PHWoZ9027890;
	Wed, 25 Mar 2020 18:32:50 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 0AD45781D;
	Wed, 25 Mar 2020 18:32:50 +0100 (CET)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 925EA66CB
 for <cocci@systeme.lip6.fr>; Wed, 25 Mar 2020 18:32:48 +0100 (CET)
Received: from mail3-relais-sop.national.inria.fr
 (mail3-relais-sop.national.inria.fr [192.134.164.104])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 02PHWmVs024595
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <cocci@systeme.lip6.fr>; Wed, 25 Mar 2020 18:32:48 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.72,305,1580770800"; d="scan'208";a="343737530"
Received: from abo-173-121-68.mrs.modulonet.fr (HELO hadrien) ([85.68.121.173])
 by mail3-relais-sop.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 25 Mar 2020 18:32:47 +0100
Date: Wed, 25 Mar 2020 18:32:47 +0100 (CET)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <757cdb2d-9274-4d7d-64b8-387c76254254@web.de>
Message-ID: <alpine.DEB.2.21.2003251830510.2306@hadrien>
References: <757cdb2d-9274-4d7d-64b8-387c76254254@web.de>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-2100759240-1585157567=:2306"
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Wed, 25 Mar 2020 18:32:50 +0100 (CET)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Wed, 25 Mar 2020 18:32:48 +0100 (CET)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: Coccinelle <cocci@systeme.lip6.fr>
Subject: Re: [Cocci] Determination of failure predicates for selected
 function calls with SmPL?
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
Sender: cocci-bounces@systeme.lip6.fr
Errors-To: cocci-bounces@systeme.lip6.fr

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-2100759240-1585157567=:2306
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT



On Wed, 25 Mar 2020, Markus Elfring wrote:

> Hello,
>
> I have noticed the patch “tty: serial: fsl_lpuart: fix return value checking”.
> https://lore.kernel.org/linux-serial/20200325090658.25967-2-michael@walle.cc/
> https://lore.kernel.org/patchwork/patch/1215542/
> https://lkml.org/lkml/2020/3/25/202
>
> I am curious if such a software transformation can be extended for similar
> source code searches also by the means of the semantic patch language.
> The proper knowledge of failure predicates for function calls is a key aspect
> for this use case.
> Would you like to clarify any corresponding development possibilities?

I'm not sure what there is to clarify.  One can surely write rules that
find this kind of problem, with a varying rate of false positives.

A simple approach would be to check all occurrences of if (!ret) for an
integer-typed variable, because typically that is the success case.  But
sometimes people do put the success case under an if.

julia
--8323329-2100759240-1585157567=:2306
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci

--8323329-2100759240-1585157567=:2306--
