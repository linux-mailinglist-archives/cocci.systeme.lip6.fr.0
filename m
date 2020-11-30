Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 178F32C8F9E
	for <lists+cocci@lfdr.de>; Mon, 30 Nov 2020 22:07:42 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 0AUL6VUT024003;
	Mon, 30 Nov 2020 22:06:31 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id A294B77CD;
	Mon, 30 Nov 2020 22:06:31 +0100 (CET)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id C162B620
 for <cocci@systeme.lip6.fr>; Mon, 30 Nov 2020 22:06:29 +0100 (CET)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 0AUL6R3f015260
 for <cocci@systeme.lip6.fr>; Mon, 30 Nov 2020 22:06:28 +0100 (CET)
IronPort-SDR: caEXdRbpwnGYxtsbari2ima0/misM1K9mlD+iYfuYtj7teBw1lkibT97R3AaYsOXiLhZ+qqplX
 p0ua2WoSVAUw==
X-IronPort-AV: E=McAfee;i="6000,8403,9821"; a="171927134"
X-IronPort-AV: E=Sophos;i="5.78,382,1599548400"; d="scan'208";a="171927134"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2020 13:06:25 -0800
IronPort-SDR: zA9NbKAwz/jI1A5E7M91ht1AbbiPeSkqcd8TwqVk4k8EESn+Z2db08eZvUfk8dThxM/eXgnipl
 OMbjAD/bhLbw==
X-IronPort-AV: E=Sophos;i="5.78,382,1599548400"; d="scan'208";a="480805985"
Received: from iweiny-desk2.sc.intel.com (HELO localhost) ([10.3.52.147])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2020 13:06:24 -0800
Date: Mon, 30 Nov 2020 13:06:24 -0800
From: Ira Weiny <ira.weiny@intel.com>
To: Julia Lawall <julia.lawall@inria.fr>
Message-ID: <20201130210624.GR1161629@iweiny-DESK2.sc.intel.com>
References: <20201128054145.GP1161629@iweiny-DESK2.sc.intel.com>
 <alpine.DEB.2.22.394.2011280849310.2725@hadrien>
 <20201130191904.GQ1161629@iweiny-DESK2.sc.intel.com>
 <alpine.DEB.2.22.394.2011302051210.2758@hadrien>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2011302051210.2758@hadrien>
User-Agent: Mutt/1.11.1 (2018-12-01)
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Mon, 30 Nov 2020 22:06:34 +0100 (CET)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Mon, 30 Nov 2020 22:06:29 +0100 (CET)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: cocci@systeme.lip6.fr
Subject: Re: [Cocci] Itterating matches
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

On Mon, Nov 30, 2020 at 08:59:42PM +0100, Julia Lawall wrote:

[snip]

> >
> >
> > Question: Is there something about userpage being declared in the outer block
> > which is causing the second rule to fail?
> 
> The problem is the while loop. The ... when != ptr goes to the end of the
> function.  It thus goes around the loop and reaches the use of userpage
> again.  You can do:
> 
> type VP, VP1;
> 
> - VP ptr;
>   ... when != ptr;
> ? VP1 ptr;
> 
> Then it will check that there is no use of ptr until reaching a new
> declaration of ptr, if any (the ? ).

Thanks!

[snip]

> >
> >
> > Yay!!!  The 'iteration' is not even needed...  :-D  So sorry for bothering you
> > on that point.
> >
> > However, I still have an issue with the second rule you specified.  It appears
> > to be too aggressive with removing kaddr; removing it from an entirely
> > unrelated function.  Why?  Is there a way to limit the scope of the second rule
> > to blocks and parent blocks?
> 
> Indeed the rule does nothing to check that the function is the same.  I
> kind of assumed that good code would not contain unused variables, and if
> the code does contain unused variables you would be happy to be rid of
> them.

But the kaddr in check_compressed_csum() is used?

 148         char *kaddr;
 149         u8 csum[BTRFS_CSUM_SIZE];
 150         struct compressed_bio *cb = bio->bi_private;
 151         u8 *cb_sum = cb->sums;
 152 
 153         if (inode->flags & BTRFS_INODE_NODATASUM)
 154                 return 0;
 155 
 156         shash->tfm = fs_info->csum_shash;
 157 
 158         for (i = 0; i < cb->nr_pages; i++) {
 159                 page = cb->compressed_pages[i];
 160 
 161                 kaddr = kmap_atomic(page);
 162                 crypto_shash_digest(shash, kaddr, PAGE_SIZE, csum);
 163                 kunmap_atomic(kaddr);

It correctly leaves this kmap_atomic alone for me.

> However, it is possible with some scripting hacks to find the name
> of the function that one rule matches and then use that information to
> filter the matches of another rule.  But again, I'm not sure it is worth
> the trouble.

Nope...  I can deal with it.  :-D  This is so much better than what I had.

Thanks again for your help,
Ira

_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
