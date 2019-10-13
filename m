Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 81651D56C3
	for <lists+cocci@lfdr.de>; Sun, 13 Oct 2019 18:10:19 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x9DG9tqT025130;
	Sun, 13 Oct 2019 18:09:55 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id B5F2277BE;
	Sun, 13 Oct 2019 18:09:55 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 9343B7415
 for <cocci@systeme.lip6.fr>; Sun, 13 Oct 2019 18:09:53 +0200 (CEST)
Received: from mail2-relais-roc.national.inria.fr
 (mail2-relais-roc.national.inria.fr [192.134.164.83])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x9DG9rEL016054
 for <cocci@systeme.lip6.fr>; Sun, 13 Oct 2019 18:09:53 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.67,292,1566856800"; d="scan'208";a="405945124"
Received: from 81-65-53-202.rev.numericable.fr (HELO hadrien) ([81.65.53.202])
 by mail2-relais-roc.national.inria.fr with
 ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 13 Oct 2019 18:09:53 +0200
Date: Sun, 13 Oct 2019 18:09:52 +0200 (CEST)
From: Julia Lawall <julia.lawall@lip6.fr>
X-X-Sender: jll@hadrien
To: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <5bab8a17-168f-6bb7-da1e-e3d3b92ca260@web.de>
Message-ID: <alpine.DEB.2.21.1910131808390.2565@hadrien>
References: <56e7bd73-5b50-ddeb-9a56-62daf93eb015@suse.com>
 <a9ba6674-92cc-d8b6-f60c-1cf0162fba75@web.de>
 <alpine.DEB.2.21.1910131536290.3260@hadrien>
 <5bab8a17-168f-6bb7-da1e-e3d3b92ca260@web.de>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-814754135-1570982993=:2565"
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Sun, 13 Oct 2019 18:09:58 +0200 (CEST)
X-Greylist: IP, sender and recipient auto-whitelisted, not delayed by
 milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]);
 Sun, 13 Oct 2019 18:09:53 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: =?ISO-8859-15?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>, cocci@systeme.lip6.fr
Subject: Re: [Cocci] =?utf-8?q?Checking_the_influence_of_=E2=80=9Cvirtual?=
 =?utf-8?q?=E2=80=9D_SmPL_variables?=
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

--8323329-814754135-1570982993=:2565
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT



On Sun, 13 Oct 2019, Markus Elfring wrote:

> >>>    virtual patch
> >>
> >> This variable should be omitted if it will not be used in subsequent SmPL rules.
> >
> > There is no harm to have it.
>
> Can you get additional software development concerns if you would look at
> a bug report on a topic like “Metavariables with the type "virtual" prevent
> proper initialisation for Python scripts.” once more?
> https://github.com/coccinelle/coccinelle/issues/35

This comment is completely irrelevant.  There is a difference between a
virtual rule, that one can declare as being matched or not from the
command line, and a virtual metavariable in a script, that has to be bound
for the script to be executed.

julia
--8323329-814754135-1570982993=:2565
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci

--8323329-814754135-1570982993=:2565--
