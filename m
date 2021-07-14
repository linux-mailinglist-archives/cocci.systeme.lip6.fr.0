Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E92A3C7C09
	for <lists+cocci@lfdr.de>; Wed, 14 Jul 2021 04:48:42 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 16E2mEVE022405;
	Wed, 14 Jul 2021 04:48:14 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id E212877F5;
	Wed, 14 Jul 2021 04:48:13 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 3D0364065
 for <cocci@systeme.lip6.fr>; Wed, 14 Jul 2021 04:48:11 +0200 (CEST)
Received: from smtprelay.hostedemail.com (smtprelay0031.hostedemail.com
 [216.40.44.31])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 16E2m9qj013773
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO)
 for <cocci@systeme.lip6.fr>; Wed, 14 Jul 2021 04:48:10 +0200 (CEST)
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com
 [10.5.19.251])
 by smtpgrave01.hostedemail.com (Postfix) with ESMTP id 7EEDA1854C070
 for <cocci@systeme.lip6.fr>; Tue, 13 Jul 2021 23:09:29 +0000 (UTC)
Received: from omf09.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
 by smtprelay02.hostedemail.com (Postfix) with ESMTP id 508902C5A4;
 Tue, 13 Jul 2021 23:09:25 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by
 omf09.hostedemail.com (Postfix) with ESMTPA id 7F83A1E04D8; 
 Tue, 13 Jul 2021 23:09:24 +0000 (UTC)
Message-ID: <42a843710a652e110b71ab6beafc3a3e6e11dfd3.camel@perches.com>
From: Joe Perches <joe@perches.com>
To: Julia Lawall <julia.lawall@inria.fr>
Date: Tue, 13 Jul 2021 16:09:22 -0700
In-Reply-To: <alpine.DEB.2.22.394.2107132332030.3024@hadrien>
References: <08b89608cfb1280624d1a89ead6547069f9a4c31.camel@perches.com>
 <alpine.DEB.2.22.394.2107102149140.46528@hadrien>
 <afd3a282ca57a4a400c8bae9879a7c57bc507c59.camel@perches.com>
 <alpine.DEB.2.22.394.2107132332030.3024@hadrien>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
X-Spam-Status: No, score=0.02
X-Stat-Signature: uztexi7wie66gnpui9nawg7xurxs43hk
X-Rspamd-Server: rspamout01
X-Rspamd-Queue-Id: 7F83A1E04D8
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX19+E355a2jKrTaUCYH65AOx1cK8B6P3fac=
X-HE-Tag: 1626217764-847900
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Wed, 14 Jul 2021 04:48:16 +0200 (CEST)
X-Greylist: Delayed for 02:59:58 by milter-greylist-4.4.3 (isis.lip6.fr
 [132.227.60.2]); Wed, 14 Jul 2021 04:48:10 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: kernel-janitors@vger.kernel.org, cocci <cocci@systeme.lip6.fr>,
        LKML <linux-kernel@vger.kernel.org>
Subject: Re: [Cocci] cocci script to convert linux-kernel allocs with
 BITS_TO_LONGS to bitmap_alloc
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

On Tue, 2021-07-13 at 23:33 +0200, Julia Lawall wrote:
> > > On Fri, 9 Jul 2021, Joe Perches wrote:
> > > > Here is a cocci script to convert various types of bitmap allocations
> > > > that use BITS_TO_LONGS to the more typical bitmap_alloc functions.
> 
> I see that there is also a bitmap_free.  Maybe the rule should be
> introducing that as well?

Yes, but as far as I know, it's difficult for coccinelle to convert
the kfree() calls of any previous bitmap_alloc to bitmap_free as
most frequently the kfree() call is in a separate function.

Please do it if you know how, you're probably the best in the world
at coccinelle.  I don't know how...

cheers, Joe

_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
